const conexion = require('../database/db');


exports.vistaIndex = (req, res) => {
  res.render('index'); // Asegúrate de tener index.ejs en tu carpeta views
};