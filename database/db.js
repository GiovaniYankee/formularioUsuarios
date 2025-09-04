const mysql = require('mysql2'); // Asegúrate de usar mysql2

const conexion = mysql.createConnection({
  host: 'localhost',
  database: 'sistema_educativo',

  user: 'root',
  password: '9024',

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
