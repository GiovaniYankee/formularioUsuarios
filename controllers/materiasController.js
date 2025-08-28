
const conexion = require("../database/db");

exports.vistaMaterias = async (req, res) => {
  try {
    const [materias] = await conexion.promise().query(`
        SELECT m.*, a.nombreAula AS nombreAula, a.capacidad
        FROM materia m
        LEFT JOIN aula a ON m.aula_idaula = a.idaula
        `);
    const [aulas] = await conexion.promise().query('SELECT idaula, nombreAula, capacidad FROM aula');
    res.render('materias', { materias, aulas });
  } catch (error) {
    console.error("Error al obtener las materias:", error);
    res.status(500).send("Error al obtener las materias");
  }
};

exports.actualizarMateria = async (req, res) => {
  const { idmateria, materia, habilitado, aula_idaula } = req.body;
  try {
    await conexion.promise().query(
      'UPDATE materia SET materia = ?, habilitado = ?, aula_idaula = ? WHERE idmateria = ?',
      [materia, habilitado, aula_idaula, idmateria]
    );
    res.json({ ok: true });
  } catch (e) {
    res.status(500).json({ ok: false, error: e.message });
  }
};