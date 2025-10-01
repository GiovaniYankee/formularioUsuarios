const conexion = require('../database/db');

exports.obtenerInscripciones = async () => {
  const [rows] = await conexion.promise().query(`
    SELECT i.*, p.apellido, p.nombre, f.nombreFacultad AS facultad, ea.estadoAlumno
    FROM inscripcion i
    LEFT JOIN persona p ON i.persona_idpersona = p.idpersona
    LEFT JOIN facultad f ON i.facultad_idfacultad = f.idfacultad
    LEFT JOIN estadoalumno ea ON i.estadoalumno_idestadoAlumno = ea.idestadoAlumno
    ORDER BY p.apellido ASC, p.nombre ASC
  `);
  return rows;
};

exports.obtenerMateriasPorIds = async (ids) => {
  if (ids.length === 0) return [];
  const [rows] = await conexion.promise().query(
    `SELECT idmateria, materia FROM materia WHERE idmateria IN (${ids.join(',')})`
  );
  return rows;
};

exports.obtenerFacultades = async () => {
  const [rows] = await conexion.promise().query(`SELECT idfacultad, nombreFacultad FROM facultad`);
  return rows;
};

exports.obtenerTodasMaterias = async () => {
  const [rows] = await conexion.promise().query(`SELECT idmateria, materia, facultad_idfacultad FROM materia`);
  return rows;
};

exports.actualizarInscripcionHabilitado = async (idinscripcion, valor) => {
  await conexion.promise().query(
    'UPDATE inscripcion SET habilitado = ? WHERE idinscripcion = ?',
    [valor, idinscripcion]
  );
};
