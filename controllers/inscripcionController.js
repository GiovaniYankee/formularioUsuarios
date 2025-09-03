
const conexion = require('../database/db');

exports.vistaInscripcion = (req, res) => {
  const queries = [
    'SELECT * FROM provincia',
    'SELECT * FROM tipopersona',
    'SELECT * FROM persona',
    'SELECT * FROM pais',
    'SELECT * FROM facultad',
    'SELECT * FROM materia',
    'SELECT * FROM tipofacultad',
    'SELECT * FROM resolucion',
  ];

  Promise.all(queries.map(query =>
    new Promise((resolve, reject) =>
      conexion.query(query, (error, results) => {
        if (error) return reject(error);
        resolve(results);
      })
    )
  ))
  .then(([provincias, tipoP, personas, paises, facultades]) => {
    res.render('inscripcionUsuario', {
      provincias,
      tipoP,
      personas,
      paises,
      facultades,
    });
  })
  .catch(error => {
    throw error;
  });
};
// Ruta para buscar persona por DNI y tipo
exports.buscarPersona = async (req, res) => {
  const { dni, tipo } = req.body;
  console.log('Datos recibidos:', dni, tipo); // Log para depurar
  try {
    const [rows] = await conexion.promise().query(
      'SELECT * FROM persona WHERE numDocumento = ? AND tipoDocumento = ?',
      [dni, tipo]
    );
    res.json({ success: true, persona2: rows });
    
  } catch (err) {
    console.error('Error en /persona/buscar:', err);
    res.status(500).json({ success: false, error: err.message });
  }
};



// Ruta para guardar o actualizar persona
exports.guardarPersona = async (req, res) => {
  const { idpersona, tipo, dni, apellido, nombre, telefono, direccion, email, cuil, nacimiento, pais, provincia, localidad, fechaAlta, genero, tipoP, situacion, habilitado } = req.body;
  try {
    if (idpersona) {
      // UPDATE
      await conexion.promise().query(
        'UPDATE persona SET apellido=?, nombre=?, telefono=?, direccion=?, correo=?, cuil=?, fechaNacimiento=?, pais_idpais=?, provincia_idprovincia=?, localidad=?, fechaAlta=?, genero=?, tipoPersona_idtipoPersona=?, situacion=?, habilitado=? WHERE idpersona=?',
        [apellido, nombre, telefono, direccion, email, cuil, nacimiento, pais, provincia, localidad, fechaAlta, genero, tipoP, situacion, habilitado, idpersona]
      );
      res.json({ msg: 'Datos actualizados correctamente. Presione Siguiente para continuar', idpersona });
    } else {
      // INSERT
      // En el else de /persona/guardar
      const [result] = await conexion.promise().query(
        'INSERT INTO persona (apellido, nombre, tipoDocumento, numDocumento, cuil, fechaNacimiento, correo, telefono, direccion, pais_idpais, provincia_idprovincia, localidad, fechaAlta, genero, tipoPersona_idtipoPersona, situacion, habilitado) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), ?, ?, ?, ?)',
        [apellido, nombre, tipo, dni, cuil, nacimiento, email, telefono, direccion, pais, provincia, localidad, genero, tipoP, situacion, habilitado]
      );
      res.json({ msg: 'Persona registrada correctamente, Presione  Siguiente para continuar', idpersona: result.insertId });
    }
  } catch (err) {
    console.error(err);
    res.status(500).json({ msg: 'Error: Complete todos los campos' });
  }
};

exports.guardarInscripcion = async (req, res) => {
  const { idpersona, idmateria, idfacultad } = req.body;
  try {
    const detalle = JSON.stringify({ idmateria });

    // Guardar inscripción
    const [inscResult] =await conexion.promise().query(
      `INSERT INTO inscripcion 
        (fechaInscripcion, persona_idpersona, fechafinal, detalle, habilitado, facultad_idfacultad, estadoalumno_idestadoalumno) 
       VALUES (NOW() - INTERVAL 3 HOUR, ?, NULL, ?, 0, ?, 1)`,
      [idpersona, detalle, idfacultad]
    );
    
      const idinscripcion = inscResult.insertId;
    // Buscar el tipo de facultad para una facultad dada
      const [facultadRows] = await conexion.promise().query(
        'SELECT tipoFacultad_idtipoFacultad FROM facultad WHERE idfacultad = ? LIMIT 1',
        [idfacultad]
      );

      if (!facultadRows.length) {
        // No se encontró la facultad
        return res.status(404).json({ msg: 'No se encontró la el evento seleccionado.' });
      }

      const tipoFacultadId = facultadRows[0].tipoFacultad_idtipoFacultad;

    // Buscar datos de importe para la facultad seleccionada
    const [importes] = await conexion.promise().query(
      'SELECT idimporte, montopesos, cantidadCuota FROM importe WHERE tipoFacultad_idtipoFacultad = ? LIMIT 1',
      [tipoFacultadId]
    );
    if (!importes.length) {
      return res.status(400).json({ msg: 'No se encontró importe para el evento seleccionado.' });
    }
    const { idimporte, montopesos, cantidadCuota } = importes[0];
    const cuotaFinal = montopesos * cantidadCuota;

    // Guardar forma de pago y obtener insertId
    const [result] = await conexion.promise().query(
      `INSERT INTO formapago
        (fechaInicio, cuotaFinal, detalle, persona_idpersona, importe_idimporte, habilitado) 
       VALUES (NOW() - INTERVAL 3 HOUR, ?, ?, ?, ?, 1)`,
      [cuotaFinal, idinscripcion, idpersona, idimporte]
    );
    const idformapago = result.insertId;
    await verificarYDeshabilitarMateria(idmateria);
    // Devuelve el monto total para mostrar en la etapa 3
    res.json({ msg: 'Inscripción guardada correctamente', cuotaFinal, idformapago });

  } catch (err) {
    console.error(err);
    res.status(500).json({ msg: 'Error al guardar inscripción' });
  }
};

async function verificarYDeshabilitarMateria(idmateria) {
  // 1. Buscar el aula y su capacidad
  const [aulaRows] = await conexion.promise().query(
    `SELECT a.idaula, a.capacidad 
     FROM materia m 
     JOIN aula a ON m.aula_idaula = a.idaula 
     WHERE m.idmateria = ? LIMIT 1`,
    [idmateria]
  );
  if (!aulaRows.length) return;

  const { capacidad } = aulaRows[0];

  // 2. Contar inscriptos en esa materia
  const [inscriptosRows] = await conexion.promise().query(
    `SELECT COUNT(*) AS cantidad 
     FROM inscripcion 
     WHERE JSON_EXTRACT(detalle, '$.idmateria') = ? AND habilitado = 1`,
    [idmateria]
  );
  const cantidadInscriptos = inscriptosRows[0].cantidad;

  // 3. Si supera o iguala la capacidad, deshabilitar la materia
  if (cantidadInscriptos >= capacidad) {
    await conexion.promise().query(
      `UPDATE materia SET habilitado = 0 WHERE idmateria = ?`,
      [idmateria]
    );
  }
}


// Ejemplo en router.js
exports.materiasPorFacultad = async (req, res) => {
  const { idFacultad } = req.params;
  try {
    const [materias] = await conexion.promise().query(
      'SELECT idmateria, materia FROM materia WHERE facultad_idfacultad = ? AND habilitado = 1',
      [idFacultad]
    );
    res.json({ materias });
  } catch (err) {
    console.error(err);
    res.status(500).json({ materias: [] });
  }
};

exports.materiasPorProvincia = async (req, res) => {
  const { idpersona, idfacultad } = req.params;
  try {
    // Obtener la provincia de la persona
    const [personaRows] = await conexion.promise().query(
      'SELECT provincia_idprovincia FROM persona WHERE idpersona = ? LIMIT 1',
      [idpersona]
    );
    if (!personaRows.length) {
      return res.status(404).json({ materias: [], msg: 'Persona no encontrada' });
    }
    const provinciaId = personaRows[0].provincia_idprovincia;

    // Obtener el nombre de la provincia
    const [provRows] = await conexion.promise().query(
      'SELECT nombreProvincia FROM provincia WHERE idprovincia = ? LIMIT 1',
      [provinciaId]
    );
    const nombreProvincia = provRows[0]?.nombreProvincia?.toLowerCase() || '';

    // Filtrar materias según la provincia
    let materiasQuery = `
      SELECT m.idmateria, m.materia, a.tipoAula
      FROM materia m
      JOIN aula a ON m.aula_idaula = a.idaula
      WHERE m.facultad_idfacultad = ? AND m.habilitado = 1
    `;
    let params = [idfacultad];

    if (nombreProvincia === 'mendoza') {
      materiasQuery += " AND a.tipoAula = 'Fisica'";
    } else {
      materiasQuery += " AND (a.tipoAula = 'Fisica' OR a.tipoAula = 'Virtual')";
    }

    const [materias] = await conexion.promise().query(materiasQuery, params);
    res.json({ materias });
  } catch (err) {
    console.error(err);
    res.status(500).json({ materias: [], msg: 'Error al obtener carreras/talleres' });
  }
};


//const crud = require('./controllers/inscripcionController');
//exports.saveCategoria = crud.saveCategoria;

// Configuración de Multer para guardar archivos en la carpeta 'doc' en la raíz del proyecto
const multer = require('multer');
const path = require('path');

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, path.join(__dirname, '../doc'));
  },
  filename: function (req, file, cb) {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    cb(null, uniqueSuffix + path.extname(file.originalname));
  }
});
const upload = multer({ storage: storage });

// Ruta para finalizar inscripción y guardar recibo con comprobante JSON
exports.finalizarInscripcion = [upload.single('comprobante'), async (req, res) => {
  const { metodoPago, montoPagado, idformapago } = req.body;
  const detalle = null;
  const filePath = req.file ? req.file.path.replace(/\\/g, '/') : null;
  const comprobanteJson = JSON.stringify({ ruta: filePath });
  try {
    // 1. Insertar el recibo
    await conexion.promise().query(
      `INSERT INTO recibo 
        (fechaRecibo, metodoPago, montoPagado, detalle, habilitado, formapago_idformapago, comprobante) 
       VALUES (NOW() - INTERVAL 3 HOUR, ?, ?, ?, 1, ?, ?)`,
      [metodoPago, montoPagado, detalle, idformapago, comprobanteJson]
    );

    // 2. Buscar detalle y persona_idpersona en formapago
    const [fpRows] = await conexion.promise().query(
      'SELECT detalle, persona_idpersona FROM formapago WHERE idformapago = ?',
      [idformapago]
    );
    if (fpRows.length === 0) {
      return res.status(404).json({ msg: 'No se encontró la deuda.' });
    }
    const detalleFP = fpRows[0].detalle;
    const personaId = fpRows[0].persona_idpersona;

    // 3. Buscar la inscripción correspondiente por idinscripcion
    const [inscRows] = await conexion.promise().query(
      'SELECT idinscripcion FROM inscripcion WHERE idinscripcion = ?',
      [detalleFP]
    );
    if (inscRows.length === 0) {
      return res.status(404).json({ msg: 'No se encontró la inscripción para actualizar.' });
    }
    const idinscripcion = inscRows[0].idinscripcion;

    // 4. Actualizar habilitado=1 en la inscripción encontrada
    await conexion.promise().query(
      'UPDATE inscripcion SET habilitado = 1 WHERE idinscripcion = ?',
      [idinscripcion]
    );

    // 5. Buscar el correo electrónico de la persona
    const [personaRows] = await conexion.promise().query(
      'SELECT correo, nombre FROM persona WHERE idpersona = ?',
      [personaId]
    );
    if (personaRows.length > 0) {
      const correo = personaRows[0].correo;
      const nombre = personaRows[0].nombre;
      // Enviar correo de confirmación
      await enviarCorreo(
        correo,
        '14° Congreso de Educación Integral – 2025',
        nombre
      );
    }

    res.json({ msg: 'Recibo guardado, comprobante subido, habilitación actualizada y correo enviado. Revise monto, solo ingrese números.', redirect: 'https://ies9024-infd.mendoza.edu.ar/sitio/' });
  } catch (err) {
    res.status(500).json({ msg: 'Error al guardar recibo, actualizar inscripción o enviar correo.' });
  }
}];

// Requiere nodemailer
const nodemailer = require('nodemailer');
const e = require('express');

// Configura tu correo y contraseña de aplicación aquí
const EMAIL_USER = 'tic.ies9024@gmail.com'; // Cambia por tu correo real
const EMAIL_PASS = 'mcpl xotk ssoc mncj'; // Cambia por tu contraseña de aplicación

// Función para enviar correo electrónico con mensaje personalizado y presentable
async function enviarCorreo(destinatario, asunto, nombrePersona) {
  let transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
      user: EMAIL_USER,
      pass: EMAIL_PASS
    }
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
 	 <li>
    📄	 <a href="https://drive.google.com/file/d/1hJKs756zA8o7satvFJQs_3Ojs_SarBO5/view?usp=drive_link" target="_blank">
     	 Descargar Cronograma
   	 </a>
 	 </li>
 	 <li>
    📑	 <a href="https://drive.google.com/file/d/1FsQ500n23nqGE9Tnt6pPbYsBAt1OrlbA/view?usp=drive_link" target="_blank">
     	 Descargar Resolución de Puntaje
   	 </a>
 	 </li>
	</ul>

        Además, queremos comentar que hemos recibido la declaración de interés tanto departamental como provincial de nuestro congreso. La misma será entregada el día de realización de las actividades.</p>
        <p style="font-size: 1.1rem; color: #0a6fa6; font-weight: bold;">¡Nos vemos el día 5 de septiembre en una jornada de intercambios y aprendizajes!</p>
        <hr style="margin: 32px 0;">
        <p style="font-size: 0.95rem; color: #888; text-align:center;">Este correo fue generado automáticamente. No responda a este mensaje.</p>
      </div>
    </div>
  `;

  let mailOptions = {
    from: EMAIL_USER,
    to: destinatario,
    subject: asunto,
    html: mensajeHtml
  };

  await transporter.sendMail(mailOptions);
}