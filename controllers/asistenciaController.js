const conexion = require('../database/db');
const QRCode = require('qrcode'); // npm install qrcode
 // Requiere nodemailer
  const nodemailer = require('nodemailer');
  
  // Configura tu correo y contraseña de aplicación aquí
  const EMAIL_USER = 'tic.ies9024@gmail.com';
const EMAIL_PASS = 'hqgr owjd girh puvb';

const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: EMAIL_USER,
    pass: EMAIL_PASS
  }
});

// Verificar transporter al iniciar para obtener errores tempranos
transporter.verify()
  .then(() => console.log('Transporter SMTP listo para enviar correos'))
  .catch(err => console.error('Error verificando transporter SMTP:', err && err.message ? err.message : err));

const asunto = "Confirmación de inscripción - 6° Jornada de Educación Técnica";
// --- PRIMERO define la función ---
async function vistaAsistencia(req, res) {
  const materia = req.query.materia || 'todas';
  const facultad = req.query.facultad || 'todas';

  // Detectar cualquier columna en 'materia' que contenga la palabra 'facultad'
  let materiaFacultadCol = null;
  try {
    const [cols] = await conexion.promise().query('SHOW COLUMNS FROM materia');
    for (const c of cols) {
      if (String(c.Field).toLowerCase().includes('facultad')) {
        materiaFacultadCol = c.Field;
        break;
      }
    }
  } catch (err) {
    console.warn('No se pudo inspeccionar columnas de materia:', err && err.code ? err.code : err);
  }

  // Traer materias incluyendo la columna detectada si existe
  let selectCols = 'idmateria, materia';
  if (materiaFacultadCol) selectCols += `, ${materiaFacultadCol}`;
  const [materiasRows] = await conexion.promise().query(`SELECT ${selectCols} FROM materia ORDER BY materia ASC`);
  const materias = materiasRows;

  // traer facultades para el select
  const [facultades] = await conexion.promise().query('SELECT idfacultad, nombreFacultad FROM facultad ORDER BY nombreFacultad ASC');

  // construir consulta con JOINs/condiciones según la columna detectada (sin hardcodear nombres)
  let query = `
    SELECT r.*, p.apellido, p.nombre, p.correo, p.telefono, p.numDocumento, m.materia
    ${materiaFacultadCol ? `, m.${materiaFacultadCol} AS materia_${materiaFacultadCol}` : ''}
    FROM registroasisten r
    LEFT JOIN inscripcion i ON r.inscripcion_idinscripcion = i.idinscripcion
    LEFT JOIN persona p ON i.persona_idpersona = p.idpersona
    LEFT JOIN materia m ON CAST(JSON_UNQUOTE(JSON_EXTRACT(i.detalle, '$.idmateria')) AS UNSIGNED) = m.idmateria
    ${materiaFacultadCol ? `LEFT JOIN facultad f ON m.${materiaFacultadCol} = f.idfacultad` : ''}
    WHERE 1=1
  `;
  const params = [];

  if (materia && materia !== 'todas') {
    query += ' AND CAST(JSON_UNQUOTE(JSON_EXTRACT(i.detalle, \'$.idmateria\')) AS UNSIGNED) = ?';
    params.push(materia);
  }

  if (facultad && facultad !== 'todas') {
    if (materiaFacultadCol) {
      query += ` AND m.${materiaFacultadCol} = ?`;
      params.push(facultad);
    } else {
      // fallback: filtrar por idfacultad dentro del JSON de inscripcion si existe
      query += ' AND CAST(JSON_UNQUOTE(JSON_EXTRACT(i.detalle, \'$.idfacultad\')) AS UNSIGNED) = ?';
      params.push(facultad);
    }
  }

  query += ' ORDER BY p.apellido ASC, p.nombre ASC';

  const [asistencias] = await conexion.promise().query(query, params);

  // filtrar lista de materias para el select si detectamos la columna de facultad
  let materiasParaEnviar = materias;
  if (facultad && facultad !== 'todas' && materiaFacultadCol) {
    materiasParaEnviar = materias.filter(m => String(m[materiaFacultadCol]) === String(facultad));
  }

  console.log('Filtro facultad:', facultad, 'col detectada en materia:', materiaFacultadCol);
  console.log('Materias devueltas para select:', materiasParaEnviar.length);

  res.render('asistencia', {
    asistencias,
    materias: materiasParaEnviar,
    facultades,
    materiaSeleccionada: materia || 'todas',
    facultadSeleccionada: facultad || 'todas'
  });

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
      mensaje1: `6° Jornada de Educación Técnica – 2025
¡Su inscripción a la 6° Jornada de Educación Técnica ha sido validada con éxito!

Estimado/a ${insc.apellido} ${insc.nombre}:

Este correo confirma que sus datos han sido validados correctamente para participar de la 6° Jornada de Educación Técnica: “Desafíos de la formación y actualización docente en los contextos actuales: análisis y algunas propuestas”.

📌 Recuerde que el taller seleccionado es: ${insc.materia}.

Para registrar su asistencia, por favor presente el siguiente código QR al momento de la acreditación el día de la jornada:

[Insertar código QR aquí]

📅 Nos vemos el día 7 de noviembre en una jornada de intercambios y aprendizajes`,
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

function esCorreoValido(correo) {
  // Validación simple, puedes mejorarla si lo necesitas
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(correo) && !correo.includes('..');
}

async function enviarCorreoAsistencia(insc, curricula) {
  const asunto = "Confirmación de inscripción - Curso Intensivo - IA Inteligencia Artificial";
  let contenidoQR = '';
  let mailOptions = {
    // Usa el mismo usuario autenticado como remitente para evitar rechazos
    from: `"Curso Intensivo - IA Inteligencia Artificial" <${EMAIL_USER}>`,
    to: insc.correo,
    subject: asunto
  };

  // Si la materia es id 2, solo envía el enlace de YouTube
  if (insc.idmateria == 2) {
    contenidoQR = `<a href="https://youtube.com/live/k6Sdjhiw29Y?feature=share" target="_blank" style="color:blue;font-weight:bold;">
      Ir a clase de YouTube
    </a>`;
    mailOptions.html = `
      <p>Curso Intensivo - IA Inteligencia Artificial – 2025<br>
      <b>¡Su inscripción al Curso Intensivo - IA Inteligencia Artificial ha sido validada con éxito!</b></p>
      <p>Estimado/a <b>${insc.apellido} ${insc.nombre}</b>:</p>
      <p>Este correo confirma que sus datos han sido validados correctamente para participar del Curso Intensivo - IA Inteligencia Artificial.</p>
      <p>📌 <b>Recuerde que se debe completar el Cupo de inscriptos para el inicio del cursado, lo mantendremos al tando con mas informacion.</p>
      <p>Para registrar su asistencia, por favor ingrese a la siguiente clase virtual:</p>
      <p>${contenidoQR}</p>
      <p>📅 Nos vemos el día 7 de noviembre en una jornada de intercambios y aprendizajes.</p>
    `;
  } else {
    // Para otras materias, envía el QR como imagen adjunta
    contenidoQR = `<img src="cid:qrimage" alt="Código QR" style="width:250px;height:250px;">`;
    mailOptions.html = `
      <p>Curso Intensivo - IA Inteligencia Artificial – 2025<br>
      <b>¡Su inscripción al Curso Intensivo - IA Inteligencia Artificial ha sido validada con éxito!</b></p>
      <p>Estimado/a <b>${insc.apellido} ${insc.nombre}</b>:</p>
      <p>Este correo confirma que sus datos han sido validados correctamente para participar del Curso Intensivo - IA Inteligencia Artificial.</p>
      <p>📌 <b>Recuerde que se debe completar el Cupo de inscriptos para el inicio del cursado, lo mantendremos al tando con mas informacion.</p>
      <p>Para registrar su asistencia, por favor presente el siguiente código QR en dia de las clases presenciales</p>
      <p>${contenidoQR}</p>
      <p>📅 Acontinuacion te Compartimos el enlace de grupo de WhatsApp, donde se en compartira ms información.</p>
      <p> https://chat.whatsapp.com/FdTuaUnUTN50EmflCSHQl7 </p>
      <p>Cronograma: https://ies9024-infd.mendoza.edu.ar/sitio/wp-content/uploads/2025/11/iaCronograma2.jpeg </p>
    `;
    if (curricula.QR) {
      // Asegurarse de pasar un Buffer con los datos decodificados en base64
      const base64data = typeof curricula.QR === 'string' ? curricula.QR.split('base64,')[1] : null;
      if (base64data) {
        mailOptions.attachments = [{
          filename: 'qr.png',
          content: Buffer.from(base64data, 'base64'),
          cid: 'qrimage'
        }];
      } else {
        console.warn('Curricula.QR no tiene formato esperado para idinscripcion=', insc.idinscripcion);
      }
    }
  }

  if (!esCorreoValido(insc.correo)) {
    console.log('Correo inválido, no se envía:', insc.correo);
    return;
  }

  try {
    console.log('Enviando correo a:', insc.correo, ' asunto:', asunto);
    const info = await transporter.sendMail(mailOptions);
    console.log('Correo enviado:', info && info.messageId ? info.messageId : info);
  } catch (err) {
    console.error('Error enviando correo a', insc.correo, ':', err && err.message ? err.message : err);
  }
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
