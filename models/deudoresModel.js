const conexion = require("../database/db");

async function obtenerFormapagos() {
  return await conexion.promise().query(`
    SELECT f.*, p.apellido, i.idinscripcion AS idInscripcion
    FROM formapago f
    LEFT JOIN persona p ON f.persona_idpersona = p.idpersona
    LEFT JOIN inscripcion i ON f.detalle = i.idinscripcion
    ORDER BY p.apellido ASC, p.nombre ASC
  `);
}

async function deshabilitarFormapago(idformapago) {
  await conexion.promise().query(
    'UPDATE formapago SET habilitado = 0 WHERE idformapago = ?',
    [idformapago]
  );
  await conexion.promise().query(
    "UPDATE recibo SET habilitado = 0, detalle = 'rechazado_duplicado' WHERE formapago_idformapago = ?",
    [idformapago]
  );
}

async function habilitarFormapago(idformapago) {
  await conexion.promise().query(
    'UPDATE formapago SET habilitado = 1 WHERE idformapago = ?',
    [idformapago]
  );
  await conexion.promise().query(
    "UPDATE recibo SET habilitado = 1, detalle = '' WHERE formapago_idformapago = ?",
    [idformapago]
  );
}

async function actualizarDetalleFormapago(idformapago, detalle) {
  await conexion.promise().query(
    'UPDATE formapago SET detalle = ?, habilitado = 1 WHERE idformapago = ?',
    [detalle, idformapago]
  );
}

module.exports = {
  obtenerFormapagos,
  deshabilitarFormapago,
  habilitarFormapago,
  actualizarDetalleFormapago
};
