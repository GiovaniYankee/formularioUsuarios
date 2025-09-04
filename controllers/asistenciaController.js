const conexion = require('../database/db');


exports.vistaIndex = async (req, res) => {
  const [asistencias] = await conexion.promise().query('SELECT * FROM registroasisten');
  res.render('asistencia', { asistencias });
};