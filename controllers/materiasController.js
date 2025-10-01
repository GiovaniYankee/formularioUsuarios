const model = require('../models/materiaModel');

exports.vistaMaterias = async (req, res) => {
  try {
    const materias = await model.obtenerMaterias();
    const aulas = await model.obtenerAulas();
    res.render('materias', { materias, aulas });
  } catch (error) {
    console.error("Error al obtener las materias:", error);
    res.status(500).send("Error al obtener las materias");
  }
};

exports.actualizarMateria = async (req, res) => {
  const { idmateria, materia, habilitado, aula_idaula } = req.body;
  try {
    await model.actualizarMateria(idmateria, materia, habilitado, aula_idaula);
    res.json({ ok: true });
  } catch (e) {
    res.status(500).json({ ok: false, error: e.message });
  }
};
