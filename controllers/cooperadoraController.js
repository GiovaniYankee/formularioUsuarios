const conexion = require('../database/db');


exports.vistaCooperadora = async (req, res) => {
  //const [recibos] = await conexion.promise().query('SELECT * FROM recibo');

  const [recibos] = await conexion.promise().query(`
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
`);
  res.render('cooperadora', { recibos });

  
};

exports.actualizarEstadoRecibo = async (req, res) => {
  const { idrecibo, estado } = req.body;
  let habilitado = 1;
  if (estado === 'rechazado' || estado === 'rechazado_duplicado') {
    habilitado = 0;
  }
  try {
    await conexion.promise().query(
      'UPDATE recibo SET detalle = ?, habilitado = ? WHERE idrecibo = ?',
      [estado, habilitado, idrecibo]
    );
    res.json({ ok: true });
  } catch (e) {
    res.status(500).json({ ok: false, error: e.message });
  }
};