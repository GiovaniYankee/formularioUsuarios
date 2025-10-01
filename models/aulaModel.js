const conexion = require('../database/db');

// Obtener todas las aulas
async function obtenerAulas() {
  const sql = 'SELECT * FROM aula';
  const [rows] = await conexion.promise().query(sql);
  return [rows];
}

// Actualizar una aula específica
async function actualizarAula(id, nombreAula, capacidad, habilitada) {
  const sql = 'UPDATE aula SET nombreAula = ?, capacidad = ?, habilitada = ? WHERE idaula = ?';
  return conexion.promise().query(sql, [nombreAula, capacidad, habilitada, id]);
}

module.exports = {
  obtenerAulas,
  actualizarAula
};
