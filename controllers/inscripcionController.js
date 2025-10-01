const model = require('../models/inscripcionModel');
const multer = require('multer');
const path = require('path');
const nodemailer = require('nodemailer');

const EMAIL_USER = 'tic.ies9024@gmail.com';
const EMAIL_PASS = 'mcpl xotk ssoc mncj';

const storage = multer.diskStorage({
  destination: (req, file, cb) => cb(null, path.join(__dirname, '../doc')),
  filename: (req, file, cb) => cb(null, Date.now() + '-' + Math.round(Math.random() * 1E9) + path.extname(file.originalname))
});
const upload = multer({ storage });

exports.vistaInscripcion = async (req, res) => {
  try {
    const [provincias, tipoP, personas, paises, facultades] = await model.obtenerDatosIniciales();
    res.render('inscripcionUsuario', { provincias, tipoP, personas, paises, facultades });
  } catch (err) {
    console.error(err);
    res.status(500).send('Error al obtener datos iniciales');
  }
};

exports.buscarPersona = async (req, res) => {
  const { dni, tipo } = req.body;
  try {
    const persona = await model.buscarPersonaPorDniTipo(dni, tipo);
    res.json({ success: true, persona2: persona });
  } catch (err) {
    console.error(err);
    res.status(500).json({ success: false, error: err.message });
  }
};

exports.guardarPersona = async (req, res) => {
  try {
    const idpersona = await model.guardarActualizarPersona(req.body);
    const msg = req.body.idpersona ? 
      'Datos actualizados correctamente. Presione Siguiente para continuar' : 
      'Persona registrada correctamente, Presione  Siguiente para continuar';
    res.json({ msg, idpersona });
  } catch (err) {
    console.error(err);
    res.status(500).json({ msg: 'Error: Complete todos los campos' });
  }
};

exports.guardarInscripcion = async (req, res) => {
  try {
    const { idpersona, idmateria, idfacultad } = req.body;
    const idinscripcion = await model.guardarInscripcion(idpersona, idmateria, idfacultad);
    const tipoFacultad = await model.obtenerTipoFacultad(idfacultad);
    const importe = await model.obtenerImportePorTipoFacultad(tipoFacultad.tipoFacultad_idtipoFacultad);
    const cuotaFinal = importe.montopesos * importe.cantidadCuota;
    const idformapago = await model.guardarFormaPago(cuotaFinal, idinscripcion, idpersona, importe.idimporte);

    await verificarYDeshabilitarMateria(idmateria);

    res.json({ msg: 'Inscripción guardada correctamente', cuotaFinal, idformapago });
  } catch (err) {
    console.error(err);
    res.status(500).json({ msg: 'Error al guardar inscripción' });
  }
};

async function verificarYDeshabilitarMateria(idmateria) {
  const aula = await model.obtenerAulaYCapacidad(idmateria);
  if (!aula) return;

  const cantidadInscriptos = await model.contarInscriptosMateria(idmateria);
  if (cantidadInscriptos >= aula.capacidad) {
    await model.deshabilitarMateria(idmateria);
  }
}

exports.materiasPorFacultad = async (req, res) => {
  try {
    const materias = await model.obtenerMateriasPorFacultad(req.params.idFacultad);
    res.json({ materias });
  } catch (err) {
    console.error(err);
    res.status(500).json({ materias: [] });
  }
};

exports.materiasPorProvincia = async (req, res) => {
  try {
    const { idpersona, idfacultad } = req.params;
    const persona = await model.obtenerProvinciaPersona(idpersona);
    if (!persona) return res.status(404).json({ materias: [], msg: 'Persona no encontrada' });

    const nombreProvincia = await model.obtenerNombreProvincia(persona.provincia_idprovincia);

    let tipoAulaCond;
    if (nombreProvincia === 'mendoza') tipoAulaCond = "a.tipoAula = 'Fisica'";
    else tipoAulaCond = "a.tipoAula = 'Fisica' OR a.tipoAula = 'Virtual'";

    const materias = await model.obtenerMateriasPorProvincia(idfacultad, tipoAulaCond);
    res.json({ materias });
  } catch (err) {
    console.error(err);
    res.status(500).json({ materias: [], msg: 'Error al obtener carreras/talleres' });
  }
};

exports.finalizarInscripcion = [upload.single('comprobante'), async (req, res) => {
  try {
    const { metodoPago, montoPagado, idformapago } = req.body;
    const detalle = null;
    const filePath = req.file ? req.file.path.replace(/\\/g, '/') : null;
    const comprobanteJson = JSON.stringify({ ruta: filePath });

    await model.guardarRecibo(metodoPago, montoPagado, detalle, idformapago, comprobanteJson);

    const fp = await model.obtenerFormapago(idformapago);
    const inscripcion = await model.obtenerInscripcionPorId(fp.detalle);
    await model.habilitarInscripcion(inscripcion.idinscripcion);

    const persona = await model.obtenerPersonaCorreo(fp.persona_idpersona);
    if (persona) await enviarCorreo(persona.correo, '14° Congreso de Educación Integral – 2025', persona.nombre);

    res.json({ msg: 'Recibo guardado, comprobante subido, habilitación actualizada y correo enviado. Revise monto, solo ingrese números.', redirect: 'https://ies9024-infd.mendoza.edu.ar/sitio/' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ msg: 'Error al guardar recibo, actualizar inscripción o enviar correo.' });
  }
}];

async function enviarCorreo(destinatario, asunto, nombrePersona) {
  let transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: { user: EMAIL_USER, pass: EMAIL_PASS }
  });

  const mensajeHtml = `
    <div style="font-family: Arial, sans-serif; background: #f6f8fa; padding: 24px;">
      <div style="max-width: 600px; margin: auto; background: #fff; border-radius: 12px; box-shadow: 0 2px 8px #e0e0e0; padding: 32px 24px;">
        <img src="https://ies9024-infd.mendoza.edu.ar/sitio/wp-content/uploads/2025/08/zocalo-mensaje.png" alt='Congreso Educación Integral' style='width:100%; max-width:400px; display:block; margin:auto; border-radius:8px;'>
        <h2 style="color: #0dcaf0; text-align:center; margin-top: 24px;">14° Congreso de Educación Integral – 2025</h2>
        <p style="font-size: 1.1rem; color: #222;">¡Su inscripción al <b>14° Congreso de Educación Integral</b> ha sido exitosa!</p>
        <p style="font-size: 1.1rem; color: #222;">Estimado/a <b>${nombrePersona}</b>:</p>
        <p style="font-size: 1.1rem; color: #222;">Este correo es la confirmación de que su inscripción al 14° Congreso de Educación Integral: <b>“Desafíos de la formación y actualización docente en los contextos actuales: análisis y algunas propuestas”</b> ha sido registrada correctamente.</p>
        <p style="font-size: 1.1rem; color: #222;">A continuación, compartimos el cronograma general del evento con los diferentes momentos para que pueda organizar su participación.<br>
        También le compartimos la Resolución de Puntaje del mismo.<br>
        <ul style="font-size: 1rem; margin-top: 8px;">
          <li>📄 <a href="https://drive.google.com/file/d/1hJKs756zA8o7satvFJQs_3Ojs_SarBO5/view?usp=drive_link" target="_blank">Descargar Cronograma</a></li>
          <li>📑 <a href="https://drive.google.com/file/d/1FsQ500n23nqGE9Tnt6pPbYsBAt1OrlbA/view?usp=drive_link" target="_blank">Descargar Resolución de Puntaje</a></li>
        </ul>
        <p style="font-size: 1.1rem; color: #0a6fa6; font-weight: bold;">¡Nos vemos el día 5 de septiembre en una jornada de intercambios y aprendizajes!</p>
        <hr style="margin: 32px 0;">
        <p style="font-size: 0.95rem; color: #888; text-align:center;">Este correo fue generado automáticamente. No responda a este mensaje.</p>
      </div>
    </div>
  `;

  await transporter.sendMail({
    from: EMAIL_USER,
    to: destinatario,
    subject: asunto,
    html: mensajeHtml
  });
}
