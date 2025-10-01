const asistenciaModel = require('../models/asistenciaModel');
const nodemailer = require('nodemailer');

const EMAIL_USER = 'tic.ies9024@gmail.com';
const EMAIL_PASS = 'mcpl xotk ssoc mncj';

const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: EMAIL_USER,
    pass: EMAIL_PASS
  }
});

async function vistaAsistencia(req, res) {
  const materia = req.query.materia;
  const materias = await asistenciaModel.obtenerMaterias();
  const asistencias = await asistenciaModel.obtenerAsistencias(materia);
  res.render('asistencia', { asistencias, materias, materiaSeleccionada: materia || 'todas' });
  crearOActualizarRegistrosAsistencia();
}

async function crearOActualizarRegistrosAsistencia() {
  const inscripciones = await asistenciaModel.obtenerInscripciones();
  const fecha = new Date();
  const fechaStr = fecha.toISOString().slice(0, 10);
  const horaStr = fecha.toTimeString().slice(0, 5);

  for (const insc of inscripciones) {
    const registros = await asistenciaModel.obtenerRegistrosPorInscripcion(insc.idinscripcion);
    const qr = await asistenciaModel.generarQR(insc.idinscripcion);

    const curricula = {
      P: "pagado",
      A1: " ",
      AT: " ",
      AE: " ",
      noti1: "",
      notiF: "",
      mensaje1: `14° Congreso de Educación Integral – 2025
¡Su inscripción al 14° Congreso de Educación Integral ha sido validada con éxito!

Estimado/a ${insc.apellido} ${insc.nombre}:

Este correo confirma que sus datos han sido validados correctamente para participar del 14° Congreso de Educación Integral: “Desafíos de la formación y actualización docente en los contextos actuales: análisis y algunas propuestas”.

📌 Recuerde que el taller seleccionado es: ${insc.materia}.

Para registrar su asistencia, por favor presente el siguiente código QR al momento de la acreditación el día de la jornada:

[Insertar código QR aquí]

📅 Nos vemos el día 5 de septiembre en una jornada de intercambios y aprendizajes`,
      mensaje2: "adios",
      QR: qr,
      Certificacion: ""
    };

    if (registros.length === 0) {
      await asistenciaModel.insertarRegistro(fechaStr, horaStr, insc.idinscripcion, curricula);
      curricula.noti1 = "pendiente";
      await asistenciaModel.actualizarCurricula(curricula, insc.idinscripcion);
    } else {
      let curr = registros[0].curricula;
      try { curr = typeof curr === 'string' ? JSON.parse(curr) : curr; } catch { curr = curricula; }
      if (!curr.noti1 || curr.noti1 !== "ok") {
        await enviarCorreoAsistencia(insc, curr);
        curr.noti1 = "ok";
        await asistenciaModel.actualizarCurricula(curr, insc.idinscripcion);
      }
    }
  }
}

function esCorreoValido(correo) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(correo) && !correo.includes('..');
}

async function enviarCorreoAsistencia(insc, curricula) {
  const asunto = "Confirmación de inscripción - 14° Congreso de Educación Integral";
  let contenidoQR = '';
  let mailOptions = {
    from: '"Congreso Educación Integral" <usuario@tuservidor.com>',
    to: insc.correo,
    subject: asunto
  };

  if (insc.idmateria == 2) {
    contenidoQR = `<a href="https://youtube.com/live/k6Sdjhiw29Y?feature=share" target="_blank" style="color:blue;font-weight:bold;">
      Ir a clase de YouTube
    </a>`;
    mailOptions.html = `
      <p>14° Congreso de Educación Integral – 2025<br>
      <b>¡Su inscripción al 14° Congreso de Educación Integral ha sido validada con éxito!</b></p>
      <p>Estimado/a <b>${insc.apellido} ${insc.nombre}</b>:</p>
      <p>Este correo confirma que sus datos han sido validados correctamente para participar del 14° Congreso de Educación Integral: “Desafíos de la formación y actualización docente en los contextos actuales: análisis y algunas propuestas”.</p>
      <p>📌 <b>Recuerde que el taller seleccionado es:</b> ${insc.materia}.</p>
      <p>Para registrar su asistencia, por favor ingrese a la siguiente clase virtual:</p>
      <p>${contenidoQR}</p>
      <p>📅 Nos vemos el día 5 de septiembre en una jornada de intercambios y aprendizajes.</p>
    `;
  } else {
    contenidoQR = `<img src="cid:qrimage" alt="Código QR" style="width:250px;height:250px;">`;
    mailOptions.html = `
      <p>14° Congreso de Educación Integral – 2025<br>
      <b>¡Su inscripción al 14° Congreso de Educación Integral ha sido validada con éxito!</b></p>
      <p>Estimado/a <b>${insc.apellido} ${insc.nombre}</b>:</p>
      <p>Este correo confirma que sus datos han sido validados correctamente para participar del 14° Congreso de Educación Integral: “Desafíos de la formación y actualización docente en los contextos actuales: análisis y algunas propuestas”.</p>
      <p>📌 <b>Recuerde que el taller seleccionado es:</b> ${insc.materia}.</p>
      <p>Para registrar su asistencia, por favor presente el siguiente código QR al momento de la acreditación el día de la jornada:</p>
      <p>${contenidoQR}</p>
      <p>📅 Nos vemos el día 5 de septiembre en una jornada de intercambios y aprendizajes.</p>
    `;
    if (curricula.QR) {
      mailOptions.attachments = [{
        filename: 'qr.png',
        content: curricula.QR.split("base64,")[1],
        encoding: 'base64',
        cid: 'qrimage'
      }];
    }
  }

  if (!esCorreoValido(insc.correo)) {
    return;
  }

  await transporter.sendMail(mailOptions);
}

async function enviarCorreosPendientes() {
  const registros = await asistenciaModel.obtenerTodosLosRegistros();
  for (const reg of registros) {
    let curr;
    try { curr = typeof reg.curricula === 'string' ? JSON.parse(reg.curricula) : reg.curricula; } catch { continue; }
    if (curr.noti1 === "pendiente" || curr.noti1 === "") {
      await enviarCorreoAsistencia(reg, curr);
      curr.noti1 = "ok";
      await asistenciaModel.actualizarCurricula(curr, reg.inscripcion_idinscripcion);
    }
  }
}

module.exports = {
  vistaAsistencia,
  crearOActualizarRegistrosAsistencia,
  enviarCorreosPendientes
};
