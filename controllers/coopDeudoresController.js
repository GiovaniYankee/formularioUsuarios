const conexion = require("../database/db");

exports.vistaDeudores = async (req, res) => {
  const [formapagos] = await conexion.promise().query(`
  SELECT f.*, p.apellido, fac.nombreFacultad AS nombreFacultad
  FROM formapago f
  LEFT JOIN persona p ON f.persona_idpersona = p.idpersona
  LEFT JOIN facultad fac ON f.detalle = fac.idfacultad
  ORDER BY p.idpersona
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