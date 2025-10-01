const model = require('../models/formacionContinuaModel');

exports.vistaFormacionContinua = async (req, res) => {
  try {
    const inscripciones = await model.obtenerInscripciones();

    // Obtener ids de materia únicos
    const idsMateria = [];
    inscripciones.forEach(insc => {
      try {
        const detalle = insc.detalle;
        if (detalle.idmateria && !idsMateria.includes(detalle.idmateria)) {
          idsMateria.push(detalle.idmateria);
        }
      } catch (e) {}
    });

    // Traer nombres de las materias
    const materiasList = await model.obtenerMateriasPorIds(idsMateria);
    const materiasMap = {};
    materiasList.forEach(m => materiasMap[String(m.idmateria)] = m.materia);

    // Agregar nombre de materia a cada inscripción
    inscripciones.forEach(insc => {
      try {
        const detalle = insc.detalle;
        insc.materia = detalle.idmateria ? materiasMap[String(detalle.idmateria)] || '' : '';
      } catch (e) {
        insc.materia = '';
      }
    });

    const facultades = await model.obtenerFacultades();
    const materias = await model.obtenerTodasMaterias();

    const inscripcionesHabilitadas = inscripciones.filter(insc => insc.habilitado == 1);

    const cantidadPorMateria = {};
    inscripcionesHabilitadas.forEach(insc => {
      if (insc.materia) {
        cantidadPorMateria[insc.materia] = (cantidadPorMateria[insc.materia] || 0) + 1;
      }
    });

    res.render('formacionContinua', { inscripciones, inscripcionesHabilitadas, facultades, materias, cantidadPorMateria });

  } catch (err) {
    console.error(err);
    res.status(500).send('Error al obtener inscripciones');
  }
};

exports.deshabilitarInscripcion = async (req, res) => {
  const { idinscripcion } = req.body;
  try {
    await model.actualizarInscripcionHabilitado(idinscripcion, 0);
    res.json({ ok: true });
  } catch (e) {
    res.status(500).json({ ok: false, error: e.message });
  }
};

exports.habilitarInscripcion = async (req, res) => {
  const { idinscripcion } = req.body;
  try {
    await model.actualizarInscripcionHabilitado(idinscripcion, 1);
    res.json({ ok: true });
  } catch (e) {
    res.status(500).json({ ok: false, error: e.message });
  }
};
