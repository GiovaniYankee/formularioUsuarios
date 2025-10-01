const modelo = require('../models/cooperadoraModel');

const vistaCooperadora = async (req, res) => {
  try {
    const [recibos] = await modelo.obtenerRecibos();
    res.render('cooperadora', { recibos });
  } catch (e) {
    res.status(500).json({ ok: false, error: e.message });
  }
};

const actualizarEstadoRecibo = async (req, res) => {
  const { idrecibo, estado } = req.body;
  let habilitado = 1;
  if (estado === 'rechazado' || estado === 'rechazado_duplicado') {
    habilitado = 0;
  }
  try {
    await modelo.actualizarRecibo(idrecibo, estado, habilitado);
    res.json({ ok: true });
  } catch (e) {
    res.status(500).json({ ok: false, error: e.message });
  }
};

const verificarTodos = async (req, res) => {
  try {
    const [recibos] = await modelo.obtenerTodosRecibos();

    for (const recibo of recibos) {
      if (recibo.detalle === 'rechazado' || recibo.detalle === 'rechazado_duplicado') {
        await modelo.actualizarFormapago(recibo.formapago_idformapago, 0);

        const [formapagos] = await modelo.obtenerFormapagoPorId(recibo.formapago_idformapago);
        if (formapagos.length > 0) {
          const idinscripcion = formapagos[0].detalle;
          if (idinscripcion) {
            await modelo.actualizarInscripcion(idinscripcion, 'Aspirante');
          }
        }
      }
      else if (recibo.detalle === 'aprobado') {
        await modelo.actualizarFormapago(recibo.formapago_idformapago, 1);

        const [formapagos] = await modelo.obtenerFormapagoPorId(recibo.formapago_idformapago);
        if (formapagos.length > 0) {
          const idinscripcion = formapagos[0].detalle;
          if (idinscripcion) {
            await modelo.actualizarInscripcion(idinscripcion, 'Regular');
          }
        }
      }
    }

    res.json({ ok: true });
  } catch (e) {
    console.error(e);
    res.status(500).json({ ok: false, error: e.message });
  }
};

module.exports = {
  vistaCooperadora,
  actualizarEstadoRecibo,
  verificarTodos
};
