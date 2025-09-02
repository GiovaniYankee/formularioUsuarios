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
  ORDER BY p.apellido ASC, p.nombre ASC
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

exports.verificarTodos = async (req, res) => {
  try {
    // Trae todos los recibos con su idformapago y detalle
    const [recibos] = await conexion.promise().query(`
      SELECT r.idrecibo, r.formapago_idformapago, r.detalle
      FROM recibo r
    `);

    for (const recibo of recibos) {
      // Si está rechazado o rechazado_duplicado, deshabilita el formapago
      if (recibo.detalle === 'rechazado' || recibo.detalle === 'rechazado_duplicado') {
        await conexion.promise().query(
          'UPDATE formapago SET habilitado = 0 WHERE idformapago = ?',
          [recibo.formapago_idformapago]
        );
        // Busca el formapago correspondiente
        const [formapagos] = await conexion.promise().query(
          'SELECT detalle FROM formapago WHERE idformapago = ?',
          [recibo.formapago_idformapago]
        );
        if (formapagos.length > 0) {
          const idinscripcion = formapagos[0].detalle; // Aquí detalle es el idinscripcion
          if (idinscripcion) {
            await conexion.promise().query(
              `UPDATE inscripcion SET estadoalumno_idestadoAlumno = (
                  SELECT idestadoAlumno FROM estadoalumno WHERE estadoAlumno = 'Aspirante' LIMIT 1
                ) WHERE idinscripcion = ?`,
              [idinscripcion]
            );
          }
        }
      }
      // Si está aprobado, busca idinscripcion en formapago.detalle y actualiza inscripcion
      else if (recibo.detalle === 'aprobado') {
        // Habilita el formapago correspondiente
        await conexion.promise().query(
          'UPDATE formapago SET habilitado = 1 WHERE idformapago = ?',
          [recibo.formapago_idformapago]
        );
        // Busca el formapago correspondiente
        const [formapagos] = await conexion.promise().query(
          'SELECT detalle FROM formapago WHERE idformapago = ?',
          [recibo.formapago_idformapago]
        );
        if (formapagos.length > 0) {
          const idinscripcion = formapagos[0].detalle; // Aquí detalle es el idinscripcion
          if (idinscripcion) {
            await conexion.promise().query(
              `UPDATE inscripcion SET estadoalumno_idestadoAlumno = (
                  SELECT idestadoAlumno FROM estadoalumno WHERE estadoAlumno = 'Regular' LIMIT 1
                ) WHERE idinscripcion = ?`,
              [idinscripcion]
            );
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

