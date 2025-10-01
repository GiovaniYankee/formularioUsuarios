const conexion = require('../database/db');

// Traer todas las inscripciones con datos de persona, facultad y estado
async function obtenerInscripciones() {
  const sql = `
    SELECT i.*, p.apellido, p.nombre, f.nombreFacultad AS facultad, ea.estadoAlumno
    FROM inscripcion i
    LEFT JOIN persona p ON i.persona_idpersona = p.idpersona
    LEFT JOIN facultad f ON i.facultad_idfacultad = f.idfacultad
    LEFT JOIN estadoalumno ea ON i.estadoalumno_idestadoAlumno = ea.idestadoAlumno
    ORDER BY p.apellido ASC, p.nombre ASC
  `;
  const [rows] = await conexion.promise().query(sql);
  return [rows];
}

// Traer materias por un array de ids
async function obtenerMateriasPorIds(idsMateria) {
  if (idsMateria.length === 0) return [];
  const sql = `SELECT idmateria, materia FROM materia WHERE idmateria IN (${idsMateria.join(',')})`;
  const [rows] = await conexion.promise().query(sql);
  return rows;
}

// Traer todas las facultades
async function obtenerFacultades() {
  const sql = `SELECT idfacultad, nombreFacultad FROM facultad`;
  const [rows] = await conexion.promise().query(sql);
  return [rows];
}

// Traer todas las materias con idfacultad
async function obtenerTodasMaterias() {
  const sql = `SELECT idmateria, materia, facultad_idfacultad FROM materia`;
  const [rows] = await conexion.promise().query(sql);
  return [rows];
}

// Habilitar o deshabilitar inscripción
async function actualizarHabilitadoInscripcion(idinscripcion, habilitado) {
  const sql = `UPDATE inscripcion SET habilitado = ? WHERE idinscripcion = ?`;
  return conexion.promise().query(sql, [habilitado, idinscripcion]);
}

module.exports = {
  obtenerInscripciones,
  obtenerMateriasPorIds,
  obtenerFacultades,
  obtenerTodasMaterias,
  actualizarHabilitadoInscripcion
};
