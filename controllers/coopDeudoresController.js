const modelo = require('../models/deudoresModel');

vistaDeudores = async (req, res) => {
  const [formapagos] = await modelo.obtenerFormapagos();
  res.render('deudasCoop', { formapagos });
};

eliminarDeuda = async (req, res) => {
  const { idformapago } = req.body;
  try {
    await modelo.deshabilitarFormapago(idformapago);
    res.json({ ok: true });
  } catch (e) {
    res.status(500).json({ ok: false, error: e.message });
  }
};

habilitarDeuda = async (req, res) => {
  const { idformapago } = req.body;
  try {
    await modelo.habilitarFormapago(idformapago);
    res.json({ ok: true });
  } catch (e) {
    res.status(500).json({ ok: false, error: e.message });
  }
};

actualizarDetalle = async (req, res) => {
  const { idformapago, detalle } = req.body;
  try {
    await modelo.actualizarDetalleFormapago(idformapago, detalle);
    res.json({ ok: true });
  } catch (e) {
    res.status(500).json({ ok: false, error: e.message });
  }
};

module.exports = {
  vistaDeudores,
  eliminarDeuda,
  habilitarDeuda,
  actualizarDetalle
};
