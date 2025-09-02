const conexion = require("../database/db");

exports.vistaDeudores = async (req, res) => {
  const [formapagos] = await conexion.promise().query(`
  SELECT f.*, p.apellido, i.idinscripcion AS idInscripcion
  FROM formapago f
  LEFT JOIN persona p ON f.persona_idpersona = p.idpersona
  LEFT JOIN inscripcion i ON f.detalle = i.idinscripcion
  ORDER BY p.apellido ASC, p.nombre ASC
`);
res.render('deudasCoop', { formapagos });
};

exports.eliminarDeuda = async (req, res) => {
  const { idformapago } = req.body;
  try {
    // Actualiza formapago
    await conexion.promise().query(
      'UPDATE formapago SET habilitado = 0 WHERE idformapago = ?',
      [idformapago]
    );
    // Actualiza recibo relacionado
    await conexion.promise().query(
      "UPDATE recibo SET habilitado = 0, detalle = 'rechazado_duplicado' WHERE formapago_idformapago = ?",
      [idformapago]
    );
    res.json({ ok: true });
  } catch (e) {
    res.status(500).json({ ok: false, error: e.message });
  }
};

exports.habilitarDeuda = async (req, res) => {
  const { idformapago } = req.body;
  try {
    // Actualiza formapago
    await conexion.promise().query(
      'UPDATE formapago SET habilitado = 1 WHERE idformapago = ?',
      [idformapago]
    );
    // Actualiza recibo relacionado
    await conexion.promise().query(
      "UPDATE recibo SET habilitado = 1, detalle = '' WHERE formapago_idformapago = ?",
      [idformapago]
    );
    res.json({ ok: true });
  } catch (e) {
    res.status(500).json({ ok: false, error: e.message });
  }
};

exports.actualizarDetalle = async (req, res) => {
  const { idformapago, detalle } = req.body;
  try {
    await conexion.promise().query(
      'UPDATE formapago SET detalle = ?, habilitado = 1 WHERE idformapago = ?',
      [detalle, idformapago]
    );
    res.json({ ok: true });
  } catch (e) {
    res.status(500).json({ ok: false, error: e.message });
  }
};