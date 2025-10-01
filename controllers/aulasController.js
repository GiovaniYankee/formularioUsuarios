const modelo = require('../models/aulaModel');

const vistaAula = async (req, res) => {
  try {
    const [aulas] = await modelo.obtenerAulas();
    res.render('aulas', { aulas });
  } catch (error) {
    console.error("Error al obtener las aulas:", error);
    res.status(500).send("Error al obtener las aulas");
  }
};

const actualizarAula = async (req, res) => {
  const { idaula, nombreAula, capacidad, habilitada } = req.body;
  try {
    await modelo.actualizarAula(idaula, nombreAula, capacidad, habilitada);
    res.json({ ok: true });
  } catch (error) {
    console.error("Error al actualizar el aula:", error);
    res.status(500).json({ ok: false });
  }
};

module.exports = {
  vistaAula,
  actualizarAula
};
