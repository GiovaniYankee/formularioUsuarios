
const conexion = require("../database/db")

exports.vistaAula = async (req, res) => {
  try {
    const [aulas] = await conexion.promise().query('SELECT * FROM aula');
    res.render('aulas', {
      aulas
    });
  } catch (error) {
    console.error("Error al obtener las aulas:", error);
    res.status(500).send("Error al obtener las aulas");
  }
};

exports.actualizarAula = async (req, res) => {
  const { idaula, nombreAula, capacidad, habilitada } = req.body;
  try {
    await conexion.promise().query(
      'UPDATE aula SET nombreAula = ?, capacidad = ?, habilitada = ? WHERE idaula = ?',
      [nombreAula, capacidad, habilitada, idaula]
    );
    res.json({ ok: true });
  } catch (error) {
    console.error("Error al actualizar el aula:", error);
    res.status(500).json({ ok: false });
  }
};