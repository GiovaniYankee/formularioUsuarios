const conexion = require('../database/db');


exports.vistaFormacionContinua = (req, res) => {
  res.render('formacionContinua'); // Asegúrate de tener formacionContinua.ejs en tu carpeta views
};