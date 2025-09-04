const e = require('express');
const db = require('../database/db');
const conexion = require('../database/db');





exports.vistaLector = async (req, res) => {
  const [materias] = await db.promise().query('SELECT idmateria, materia FROM materia ORDER BY materia ASC');
  res.render('lector', { materias });
};

exports.buscarPorInscripcion = async (req, res) => {
  const idinscripcion = req.params.idinscripcion;
  try {
    const [rows] = await conexion.promise().query(`
      SELECT p.apellido, p.nombre, p.numDocumento AS dni, m.materia
      FROM inscripcion i
      LEFT JOIN persona p ON i.persona_idpersona = p.idpersona
      LEFT JOIN materia m ON CAST(JSON_UNQUOTE(JSON_EXTRACT(i.detalle, '$.idmateria')) AS UNSIGNED) = m.idmateria
      WHERE i.idinscripcion = ?
        AND i.habilitado = 1
        AND i.estadoalumno_idestadoAlumno = (
          SELECT idestadoAlumno FROM estadoalumno WHERE estadoAlumno = 'Regular' LIMIT 1
        )
      LIMIT 1
    `, [idinscripcion]);
    if (rows.length > 0) {
      res.json({ ok: true, ...rows[0] });
    } else {
      res.json({ ok: false, msg: "No se encontró una inscripción habilitada y Regular" });
    }
  } catch (e) {
    res.json({ ok: false, msg: "Error en la búsqueda" });
  }
};

exports.buscarPorDNI = async (req, res) => {
  const dni = req.params.dni;
  try {
    const [rows] = await db.promise().query(`
      SELECT i.idinscripcion, p.apellido, p.nombre, p.numDocumento AS dni, m.materia
      FROM inscripcion i
      LEFT JOIN persona p ON i.persona_idpersona = p.idpersona
      LEFT JOIN materia m ON CAST(JSON_UNQUOTE(JSON_EXTRACT(i.detalle, '$.idmateria')) AS UNSIGNED) = m.idmateria
      WHERE p.numDocumento = ?
        AND i.habilitado = 1
        AND i.estadoalumno_idestadoAlumno = (
          SELECT idestadoAlumno FROM estadoalumno WHERE estadoAlumno = 'Regular' LIMIT 1
        )
      LIMIT 1
    `, [dni]);
    if (rows.length > 0) {
      res.json({ ok: true, ...rows[0] });
    } else {
      res.json({ ok: false, msg: "No se encontró inscripción habilitada y regular para ese DNI" });
    }
  } catch (e) {
    res.json({ ok: false, msg: "Error en la búsqueda" });
  }
};

exports.actualizarA1 = async (req, res) => {
  const { idinscripcion, campo, valor, idmateria } = req.body;
  try {
    const [inscRows] = await db.promise().query(`
      SELECT i.habilitado, i.estadoalumno_idestadoAlumno, 
             CAST(JSON_UNQUOTE(JSON_EXTRACT(i.detalle, '$.idmateria')) AS UNSIGNED) AS idmateria_json
      FROM inscripcion i
      WHERE i.idinscripcion = ?
      LIMIT 1
    `, [idinscripcion]);
    if (inscRows.length === 0) {
      return res.json({ ok: false, msg: "No existe inscripción" });
    }
    const insc = inscRows[0];
    if (insc.habilitado != 1) {
      return res.json({ ok: false, msg: "La inscripción no está habilitada" });
    }
    const [regRows] = await db.promise().query(
      "SELECT idestadoAlumno FROM estadoalumno WHERE estadoAlumno = 'Regular' LIMIT 1"
    );
    if (!regRows.length || insc.estadoalumno_idestadoAlumno != regRows[0].idestadoAlumno) {
      return res.json({ ok: false, msg: "La inscripción no está en estado Regular" });
    }
    // Verifica materia solo si campo es AT y hay idmateria
    if (campo === "AT" && idmateria && parseInt(insc.idmateria_json) !== parseInt(idmateria)) {
      return res.json({ ok: false, msg: "No pertenece a esta materia" });
    }

    // Actualiza el campo en el JSON curricula
    const [rows] = await db.promise().query(
      'SELECT curricula FROM registroasisten WHERE inscripcion_idinscripcion = ? LIMIT 1',
      [idinscripcion]
    );
    if (rows.length === 0) {
      return res.json({ ok: false, msg: "No existe registro de asistencia para esa inscripción" });
    }
    let curricula = rows[0].curricula;
    if (typeof curricula === 'string') {
      try { curricula = JSON.parse(curricula); } catch { curricula = {}; }
    }
    curricula[campo] = valor;
    await db.promise().query(
      'UPDATE registroasisten SET curricula = ? WHERE inscripcion_idinscripcion = ?',
      [JSON.stringify(curricula), idinscripcion]
    );
    res.json({ ok: true, msg: `${campo} actualizado correctamente` });
  } catch (e) {
    res.json({ ok: false, msg: "Error al actualizar" });
  }
};
