const model = require('../models/lectorModel');

exports.vistaLector = async (req, res) => {
  try {
    const materias = await model.obtenerMaterias();
    res.render('lector', { materias });
  } catch (err) {
    console.error(err);
    res.status(500).send('Error al cargar materias');
  }
};

exports.buscarPorInscripcion = async (req, res) => {
  try {
    const insc = await model.buscarPorInscripcion(req.params.idinscripcion);
    if (insc) res.json({ ok: true, ...insc });
    else res.json({ ok: false, msg: "No se encontró una inscripción habilitada y Regular" });
  } catch (err) {
    console.error(err);
    res.json({ ok: false, msg: "Error en la búsqueda" });
  }
};

exports.buscarPorDNI = async (req, res) => {
  try {
    const insc = await model.buscarPorDNI(req.params.dni);
    if (insc) res.json({ ok: true, ...insc });
    else res.json({ ok: false, msg: "No se encontró inscripción habilitada y regular para ese DNI" });
  } catch (err) {
    console.error(err);
    res.json({ ok: false, msg: "Error en la búsqueda" });
  }
};

exports.actualizarA1 = async (req, res) => {
  const { idinscripcion, campo, valor, idmateria } = req.body;
  try {
    const insc = await model.obtenerInscripcionPorId(idinscripcion);
    if (!insc) return res.json({ ok: false, msg: "No existe inscripción" });
    if (insc.habilitado != 1) return res.json({ ok: false, msg: "La inscripción no está habilitada" });

    const reg = await model.obtenerEstadoRegular();
    if (!reg || insc.estadoalumno_idestadoAlumno != reg.idestadoAlumno)
      return res.json({ ok: false, msg: "La inscripción no está en estado Regular" });

    if (campo === "AT" && idmateria && parseInt(insc.idmateria_json) !== parseInt(idmateria))
      return res.json({ ok: false, msg: "No pertenece a esta materia" });

    let asistencia = await model.obtenerRegistroAsistencia(idinscripcion);
    if (!asistencia) return res.json({ ok: false, msg: "No existe registro de asistencia para esa inscripción" });

    let curricula = asistencia.curricula;
    if (typeof curricula === 'string') {
      try { curricula = JSON.parse(curricula); } catch { curricula = {}; }
    }
    curricula[campo] = valor;
    await model.actualizarRegistroAsistencia(idinscripcion, curricula);

    res.json({ ok: true, msg: `${campo} actualizado correctamente` });
  } catch (err) {
    console.error(err);
    res.json({ ok: false, msg: "Error al actualizar" });
  }
};
