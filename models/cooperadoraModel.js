const conexion = require('../database/db');


const obtenerRecibos = async () => {
  return conexion.promise().query(`
    SELECT r.*, 
           f.persona_idpersona, 
           p.idpersona, 
           p.nombre, 
           p.apellido, 
           p.numDocumento,
           p.correo,
           p.telefono
    FROM recibo r
    LEFT JOIN formapago f ON r.formapago_idformapago = f.idformapago
    LEFT JOIN persona p ON f.persona_idpersona = p.idpersona
    ORDER BY p.apellido ASC, p.nombre ASC
  `);
};

const actualizarRecibo = async (idrecibo, estado, habilitado) => {
  return conexion.promise().query(
    'UPDATE recibo SET detalle = ?, habilitado = ? WHERE idrecibo = ?',
    [estado, habilitado, idrecibo]
  );
};

const obtenerTodosRecibos = async () => {
  return conexion.promise().query(`
    SELECT r.idrecibo, r.formapago_idformapago, r.detalle
    FROM recibo r
  `);
};

const actualizarFormapago = async (idformapago, habilitado) => {
  return conexion.promise().query(
    'UPDATE formapago SET habilitado = ? WHERE idformapago = ?',
    [habilitado, idformapago]
  );
};

const obtenerFormapagoPorId = async (idformapago) => {
  return conexion.promise().query(
    'SELECT detalle FROM formapago WHERE idformapago = ?',
    [idformapago]
  );
};

const actualizarInscripcion = async (idinscripcion, estadoAlumno) => {
  return conexion.promise().query(
    `UPDATE inscripcion SET estadoalumno_idestadoAlumno = (
        SELECT idestadoAlumno FROM estadoalumno WHERE estadoAlumno = ? LIMIT 1
     ) WHERE idinscripcion = ?`,
    [estadoAlumno, idinscripcion]
  );
};

module.exports = {
  obtenerRecibos,
  actualizarRecibo,
  obtenerTodosRecibos,
  actualizarFormapago,
  obtenerFormapagoPorId,
  actualizarInscripcion
};