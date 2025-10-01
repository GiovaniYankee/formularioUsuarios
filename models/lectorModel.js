const db = require('../database/db');

exports.obtenerMaterias = async () => {
  const [materias] = await db.promise().query('SELECT idmateria, materia FROM materia ORDER BY materia ASC');
  return materias;
};

exports.buscarPorInscripcion = async (idinscripcion) => {
  const [rows] = await db.promise().query(`
    SELECT p.apellido, p.nombre, p.numDocumento AS dni, m.materia
    FROM inscripcion i
    LEFT JOIN persona p ON i.persona_idpersona = p.idpersona
    LEFT JOIN materia m ON CAST(JSON_UNQUOTE(JSON_EXTRACT(i.detalle, '$.idmateria')) AS UNSIGNED) = m.idmateria
    WHERE i.idinscripcion = ?
      AND i.habilitado = 1
      AND i.estadoalumno_idestadoAlumno = (
        SELECT idestadoAlumno FROM estadoalumno WHERE estadoAlumno = 'Regular' LIMIT 1
      )
    LIMIT 1
  `, [idinscripcion]);
  return rows[0];
};

exports.buscarPorDNI = async (dni) => {
  const [rows] = await db.promise().query(`
    SELECT i.idinscripcion, p.apellido, p.nombre, p.numDocumento AS dni, m.materia
    FROM inscripcion i
    LEFT JOIN persona p ON i.persona_idpersona = p.idpersona
    LEFT JOIN materia m ON CAST(JSON_UNQUOTE(JSON_EXTRACT(i.detalle, '$.idmateria')) AS UNSIGNED) = m.idmateria
    WHERE p.numDocumento = ?
      AND i.habilitado = 1
      AND i.estadoalumno_idestadoAlumno = (
        SELECT idestadoAlumno FROM estadoalumno WHERE estadoAlumno = 'Regular' LIMIT 1
      )
    LIMIT 1
  `, [dni]);
  return rows[0];
};

exports.obtenerInscripcionPorId = async (idinscripcion) => {
  const [rows] = await db.promise().query(`
    SELECT i.habilitado, i.estadoalumno_idestadoAlumno, 
           CAST(JSON_UNQUOTE(JSON_EXTRACT(i.detalle, '$.idmateria')) AS UNSIGNED) AS idmateria_json
    FROM inscripcion i
    WHERE i.idinscripcion = ?
    LIMIT 1
  `, [idinscripcion]);
  return rows[0];
};

exports.obtenerEstadoRegular = async () => {
  const [rows] = await db.promise().query(
    "SELECT idestadoAlumno FROM estadoalumno WHERE estadoAlumno = 'Regular' LIMIT 1"
  );
  return rows[0];
};

exports.obtenerRegistroAsistencia = async (idinscripcion) => {
  const [rows] = await db.promise().query(
    'SELECT curricula FROM registroasisten WHERE inscripcion_idinscripcion = ? LIMIT 1',
    [idinscripcion]
  );
  return rows[0];
};

exports.actualizarRegistroAsistencia = async (idinscripcion, curricula) => {
  await db.promise().query(
    'UPDATE registroasisten SET curricula = ? WHERE inscripcion_idinscripcion = ?',
    [JSON.stringify(curricula), idinscripcion]
  );
};
