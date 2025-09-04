const conexion = require('../database/db');

exports.vistaFormacionContinua = async (req, res) => {
  try {
    // Trae inscripciones y persona
    const [inscripciones] = await conexion.promise().query(`
      SELECT i.*, p.apellido, p.nombre, f.nombreFacultad AS facultad, ea.estadoAlumno,
CAST(JSON_UNQUOTE(JSON_EXTRACT(i.detalle, '$.idmateria')) AS UNSIGNED) AS idmateria
FROM inscripcion i
LEFT JOIN persona p ON i.persona_idpersona = p.idpersona
LEFT JOIN facultad f ON i.facultad_idfacultad = f.idfacultad
LEFT JOIN estadoalumno ea ON i.estadoalumno_idestadoAlumno = ea.idestadoAlumno
ORDER BY p.apellido ASC, p.nombre ASC
    `);
     
    // Obtén todos los ids de materia únicos
    const idsMateria = [];
    inscripciones.forEach(insc => {
      try {
        const detalle = insc.detalle;
        if (detalle.idmateria && !idsMateria.includes(detalle.idmateria)) {
          idsMateria.push(detalle.idmateria);
        }
      } catch (e) {}
    });

    // Trae los nombres de las materias
    let materiasMap = {};
    if (idsMateria.length > 0) {
      const [materias] = await conexion.promise().query(
        `SELECT idmateria, materia FROM materia WHERE idmateria IN (${idsMateria.join(',')})`
      );
      materias.forEach(m => {
        materiasMap[String(m.idmateria)] = m.materia;
      });
    }

    // Agrega el nombre de la materia a cada inscripción
    inscripciones.forEach(insc => {
      try {
        const detalle = insc.detalle;
        insc.materia = detalle.idmateria ? materiasMap[String(detalle.idmateria)] || '' : '';

      } catch (e) {
        insc.materia = '';
      }
    });
    // Trae todas las facultades
    const [facultades] = await conexion.promise().query(`SELECT idfacultad, nombreFacultad FROM facultad`);

    // Trae todas las materias con su idfacultad
    const [materias] = await conexion.promise().query(`SELECT idmateria, materia, facultad_idfacultad FROM materia`);
     // Solo inscripciones habilitadas por defecto
    let inscripcionesHabilitadas = inscripciones.filter(insc => insc.habilitado == 1);
    // contar inscripciones
    let cantidadPorMateria = {};
    inscripcionesHabilitadas.forEach(insc => {
      if (insc.materia) {
        cantidadPorMateria[insc.materia] = (cantidadPorMateria[insc.materia] || 0) + 1;
      }
    });
    res.render('formacionContinua', { inscripciones, inscripcionesHabilitadas, facultades, materias, cantidadPorMateria });
  } catch (err) {
    res.status(500).send('Error al obtener inscripciones');
  }
};

exports.deshabilitarInscripcion = async (req, res) => {
  const { idinscripcion } = req.body;
  try {
    await conexion.promise().query(
      'UPDATE inscripcion SET habilitado = 0 WHERE idinscripcion = ?',
      [idinscripcion]
    );
    res.json({ ok: true });
  } catch (e) {
    res.status(500).json({ ok: false, error: e.message });
  }
};

exports.habilitarInscripcion = async (req, res) => {
  const { idinscripcion } = req.body;
  try {
    await conexion.promise().query(
      'UPDATE inscripcion SET habilitado = 1 WHERE idinscripcion = ?',
      [idinscripcion]
    );
    res.json({ ok: true });
  } catch (e) {
    res.status(500).json({ ok: false, error: e.message });
  }
};