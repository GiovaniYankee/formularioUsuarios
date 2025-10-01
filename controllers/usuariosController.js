const usuariosModel = require('../models/usuariosModel');

exports.vistaUsuarios = async (req, res) => {
  try {
    const [personas] = await usuariosModel.obtenerPersonas();
    res.render('usuarios', { personas });
  } catch (err) {
    console.error(err);
    res.status(500).send('Error al obtener usuarios');
  }
};

exports.editarPersona = async (req, res) => {
  try {
    await usuariosModel.actualizarPersona(req.body);
    res.redirect('/personas');
  } catch (err) {
    console.error(err);
    res.status(500).send('Error al actualizar usuario');
  }
};
