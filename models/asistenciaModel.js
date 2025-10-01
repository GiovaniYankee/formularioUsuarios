const conexion = require('../database/db');
const QRCode = require('qrcode');

async function obtenerMaterias() {
  const [materias] = await conexion.promise().query('SELECT idmateria, materia FROM materia ORDER BY materia ASC');
  return materias;
}

async function obtenerAsistencias(materia) {
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
  query += ' ORDER BY p.apellido ASC, p.nombre ASC';
  const [asistencias] = await conexion.promise().query(query, params);
  return asistencias;
}

async function obtenerInscripciones() {
  const [inscripciones] = await conexion.promise().query(`
    SELECT i.idinscripcion, i.persona_idpersona, p.apellido, p.nombre, p.correo, p.telefono, m.materia
    FROM inscripcion i
    LEFT JOIN persona p ON i.persona_idpersona = p.idpersona
    LEFT JOIN materia m ON CAST(JSON_UNQUOTE(JSON_EXTRACT(i.detalle, '$.idmateria')) AS UNSIGNED) = m.idmateria
    WHERE i.habilitado = 1
      AND i.estadoalumno_idestadoAlumno = (SELECT idestadoAlumno FROM estadoalumno WHERE estadoAlumno = 'Regular' LIMIT 1)
  `);
  return inscripciones;
}

async function obtenerRegistrosPorInscripcion(id) {
  const [registros] = await conexion.promise().query(
    'SELECT * FROM registroasisten WHERE inscripcion_idinscripcion = ?',
    [id]
  );
  return registros;
}

async function insertarRegistro(fechaStr, horaStr, idinscripcion, curricula) {
  await conexion.promise().query(
    `INSERT INTO registroasisten 
      (fechaRegistro, horaRegistro, asistencia, inscripcion_idinscripcion, curricula)
     VALUES (?, ?, ?, ?, ?)`,
    [
      fechaStr,
      horaStr,
      "A",
      idinscripcion,
      JSON.stringify(curricula)
    ]
  );
}

async function actualizarCurricula(curricula, idinscripcion) {
  await conexion.promise().query(
    `UPDATE registroasisten SET curricula=? WHERE inscripcion_idinscripcion=?`,
    [JSON.stringify(curricula), idinscripcion]
  );
}

async function obtenerTodosLosRegistros() {
  const [registros] = await conexion.promise().query(`
    SELECT r.*, i.*, p.*, m.*
    FROM registroasisten r
    LEFT JOIN inscripcion i ON r.inscripcion_idinscripcion = i.idinscripcion
    LEFT JOIN persona p ON i.persona_idpersona = p.idpersona
    LEFT JOIN materia m ON CAST(JSON_UNQUOTE(JSON_EXTRACT(i.detalle, '$.idmateria')) AS UNSIGNED) = m.idmateria
  `);
  return registros;
}

async function generarQR(idinscripcion) {
  return await QRCode.toDataURL(String(idinscripcion));
}

module.exports = {
  obtenerMaterias,
  obtenerAsistencias,
  obtenerInscripciones,
  obtenerRegistrosPorInscripcion,
  insertarRegistro,
  actualizarCurricula,
  obtenerTodosLosRegistros,
  generarQR
};
