const db = require('../database/db');

exports.obtenerMaterias = async () => {
  const [materias] = await db.promise().query(`
    SELECT m.*, a.nombreAula AS nombreAula, a.capacidad
    FROM materia m
    LEFT JOIN aula a ON m.aula_idaula = a.idaula
  `);
  return materias;
};

exports.obtenerAulas = async () => {
  const [aulas] = await db.promise().query(`
    SELECT idaula, nombreAula, capacidad FROM aula
  `);
  return aulas;
};

exports.actualizarMateria = async (idmateria, materia, habilitado, aula_idaula) => {
  await db.promise().query(
    'UPDATE materia SET materia = ?, habilitado = ?, aula_idaula = ? WHERE idmateria = ?',
    [materia, habilitado, aula_idaula, idmateria]
  );
};
