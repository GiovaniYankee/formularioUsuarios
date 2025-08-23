const mysql = require('mysql2'); // Asegúrate de usar mysql2

const conexion = mysql.createConnection({
  host: '127.0.0.1:3306',
  database: 'u873315539_BDdatosIes',
  user: 'u873315539_tic9024',
  password: 'equipoTic9024',
});

conexion.connect((error) => {
    if (error) {
      if (error.code === 'ER_NOT_SUPPORTED_AUTH_MODE') {
        console.error('Error de autenticación: ' + error.message);
      } else {
        throw error;
      }
    } else {
      console.log('Conexión Exitosa');
    }
  });
  
  module.exports = conexion;
