const conexion = require('../database/db');
const QRCode = require('qrcode'); // npm install qrcode
 // Requiere nodemailer
  const nodemailer = require('nodemailer');
  
  // Configura tu correo y contraseña de aplicación aquí
  const EMAIL_USER = 'tic.ies9024@gmail.com';
const EMAIL_PASS = 'mcpl xotk ssoc mncj';

const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: EMAIL_USER,
    pass: EMAIL_PASS
  }
});

const asunto = "Confirmación de inscripción - 14° Congreso de Educación Integral";
// --- PRIMERO define la función ---
async function vistaAsistencia(req, res) {
  const materia = req.query.materia;
  const [materias] = await conexion.promise().query('SELECT idmateria, materia FROM materia ORDER BY materia ASC');
  let query = `
    SELECT r.*, p.apellido, p.nombre, p.correo, p.telefono , p.numDocumento, m.materia, 
           CAST(JSON_UNQUOTE(JSON_EXTRACT(i.detalle, '$.idmateria')) AS UNSIGNED) AS idmateria
    FROM registroasisten r
    LEFT JOIN inscripcion i ON r.inscripcion_idinscripcion = i.idinscripcion
    LEFT JOIN persona p ON i.persona_idpersona = p.idpersona
    LEFT JOIN materia m ON CAST(JSON_UNQUOTE(JSON_EXTRACT(i.detalle, '$.idmateria')) AS UNSIGNED) = m.idmateria
  `;
  let params = [];
  if (materia && materia !== 'todas') {
    query += ' WHERE CAST(JSON_UNQUOTE(JSON_EXTRACT(i.detalle, \'$.idmateria\')) AS UNSIGNED) = ?';
    params.push(materia);
  }
  // Ordena por apellido y nombre
  query += ' ORDER BY p.apellido ASC, p.nombre ASC';
  const [asistencias] = await conexion.promise().query(query, params);
  res.render('asistencia', { asistencias, materias, materiaSeleccionada: materia || 'todas' });
crearOActualizarRegistrosAsistencia();

}

async function crearOActualizarRegistrosAsistencia() {
  const [inscripciones] = await conexion.promise().query(`
    SELECT i.idinscripcion, i.persona_idpersona, p.apellido, p.nombre, p.correo, p.telefono, m.materia
    FROM inscripcion i
    LEFT JOIN persona p ON i.persona_idpersona = p.idpersona
    LEFT JOIN materia m ON CAST(JSON_UNQUOTE(JSON_EXTRACT(i.detalle, '$.idmateria')) AS UNSIGNED) = m.idmateria
    WHERE i.habilitado = 1
      AND i.estadoalumno_idestadoAlumno = (SELECT idestadoAlumno FROM estadoalumno WHERE estadoAlumno = 'Regular' LIMIT 1)
  `);
  console.log("Inscripciones encontradas:", inscripciones.length);

  const fecha = new Date();
  const fechaStr = fecha.toISOString().slice(0, 10);
  const horaStr = fecha.toTimeString().slice(0, 5);

  for (const insc of inscripciones) {
    // 2. Verificar si ya existe registro para esta inscripción
    const [registros] = await conexion.promise().query(
      'SELECT * FROM registroasisten WHERE inscripcion_idinscripcion = ?',
      [insc.idinscripcion]
    );

    // 3. Generar QR con el idinscripcion
    const qr = await QRCode.toDataURL(String(insc.idinscripcion));

    // 4. Construir el JSON curricula
    const curricula = {
      P: "pagado",
      A1: " ", // se actualizará según la regla de horario
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

    // 5. Si no existe, crear el registro
    if (registros.length === 0) {
      await conexion.promise().query(
        `INSERT INTO registroasisten 
          (fechaRegistro, horaRegistro, asistencia, inscripcion_idinscripcion, curricula)
         VALUES (?, ?, ?, ?, ?)`,
        [
          fechaStr,
          horaStr,
          "A", // A=proceso, T=terminado
          insc.idinscripcion,
          JSON.stringify(curricula)
        ]
      );
      // NO enviar correo aquí
      // await enviarCorreoAsistencia(insc, curricula);
      curricula.noti1 = "pendiente"; // Marcar como pendiente
      await conexion.promise().query(
        `UPDATE registroasisten SET curricula=? WHERE inscripcion_idinscripcion=?`,
        [JSON.stringify(curricula), insc.idinscripcion]
      );
    } else {
      // 6. Si existe, revisa si noti1 o notiF no están "ok" y actualiza si es necesario
      let curr = registros[0].curricula;
      try { curr = typeof curr === 'string' ? JSON.parse(curr) : curr; } catch { curr = curricula; }
      if (!curr.noti1 || curr.noti1 !== "ok") {
        await enviarCorreoAsistencia(insc, curr);
        curr.noti1 = "ok";
        await conexion.promise().query(
          `UPDATE registroasisten SET curricula=? WHERE inscripcion_idinscripcion=?`,
          [JSON.stringify(curr), insc.idinscripcion]
        );
      }
    }
  }
}

async function enviarCorreoAsistencia(insc, curricula) {
  const asunto = "Confirmación de inscripción - 14° Congreso de Educación Integral";
  let contenidoQR = '';
  let mailOptions = {
    from: '"Congreso Educación Integral" <usuario@tuservidor.com>',
    to: insc.correo,
    subject: asunto
  };

  // Si la materia es id 2, solo envía el enlace de YouTube
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
    // Para otras materias, envía el QR como imagen adjunta
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

  await transporter.sendMail(mailOptions);
}

async function enviarCorreosPendientes() {
  const [registros] = await conexion.promise().query(`
    SELECT r.*, i.*, p.*, m.*
    FROM registroasisten r
    LEFT JOIN inscripcion i ON r.inscripcion_idinscripcion = i.idinscripcion
    LEFT JOIN persona p ON i.persona_idpersona = p.idpersona
    LEFT JOIN materia m ON CAST(JSON_UNQUOTE(JSON_EXTRACT(i.detalle, '$.idmateria')) AS UNSIGNED) = m.idmateria
  `);

  for (const reg of registros) {
    let curr;
    try { curr = typeof reg.curricula === 'string' ? JSON.parse(reg.curricula) : reg.curricula; } catch { continue; }
    if (curr.noti1 === "pendiente" || curr.noti1==="") {
      await enviarCorreoAsistencia(reg, curr);
      curr.noti1 = "ok";
      await conexion.promise().query(
        `UPDATE registroasisten SET curricula=? WHERE inscripcion_idinscripcion=?`,
        [JSON.stringify(curr), reg.inscripcion_idinscripcion]
      );
    }
  }
}

module.exports = {
  vistaAsistencia,
  crearOActualizarRegistrosAsistencia,
  enviarCorreosPendientes
};
