const conexion = require('../database/db');

exports.obtenerDatosIniciales = async () => {
  const queries = [
    'SELECT * FROM provincia',
    'SELECT * FROM tipopersona',
    'SELECT * FROM persona',
    'SELECT * FROM pais',
    'SELECT * FROM facultad',
    'SELECT * FROM materia',
    'SELECT * FROM tipofacultad',
    'SELECT * FROM resolucion',
  ];

  const resultados = await Promise.all(
    queries.map(q => conexion.promise().query(q).then(([rows]) => rows))
  );

  return resultados; // devuelve array: [provincias, tipoP, personas, paises, facultades, materias, tipofacultad, resolucion]
};

exports.buscarPersonaPorDniTipo = async (dni, tipo) => {
  const [rows] = await conexion.promise().query(
    'SELECT * FROM persona WHERE numDocumento = ? AND tipoDocumento = ?',
    [dni, tipo]
  );
  return rows;
};

exports.guardarActualizarPersona = async (personaData) => {
  const { idpersona, tipo, dni, apellido, nombre, telefono, direccion, email, cuil, nacimiento, pais, provincia, localidad, fechaAlta, genero, tipoP, situacion, habilitado } = personaData;

  if (idpersona) {
    await conexion.promise().query(
      `UPDATE persona SET 
        apellido=?, nombre=?, telefono=?, direccion=?, correo=?, cuil=?, fechaNacimiento=?, 
        pais_idpais=?, provincia_idprovincia=?, localidad=?, fechaAlta=?, genero=?, tipoPersona_idtipoPersona=?, situacion=?, habilitado=? 
      WHERE idpersona=?`,
      [apellido, nombre, telefono, direccion, email, cuil, nacimiento, pais, provincia, localidad, fechaAlta, genero, tipoP, situacion, habilitado, idpersona]
    );
    return idpersona;
  } else {
    const [result] = await conexion.promise().query(
      `INSERT INTO persona 
        (apellido, nombre, tipoDocumento, numDocumento, cuil, fechaNacimiento, correo, telefono, direccion, pais_idpais, provincia_idprovincia, localidad, fechaAlta, genero, tipoPersona_idtipoPersona, situacion, habilitado) 
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), ?, ?, ?, ?)`,
      [apellido, nombre, tipo, dni, cuil, nacimiento, email, telefono, direccion, pais, provincia, localidad, genero, tipoP, situacion, habilitado]
    );
    return result.insertId;
  }
};

exports.guardarInscripcion = async (idpersona, idmateria, idfacultad) => {
  const detalle = JSON.stringify({ idmateria });

  const [inscResult] = await conexion.promise().query(
    `INSERT INTO inscripcion 
      (fechaInscripcion, persona_idpersona, fechafinal, detalle, habilitado, facultad_idfacultad, estadoalumno_idestadoalumno) 
     VALUES (NOW() - INTERVAL 3 HOUR, ?, NULL, ?, 0, ?, 1)`,
    [idpersona, detalle, idfacultad]
  );
  return inscResult.insertId;
};

exports.obtenerTipoFacultad = async (idfacultad) => {
  const [rows] = await conexion.promise().query(
    'SELECT tipoFacultad_idtipoFacultad FROM facultad WHERE idfacultad = ? LIMIT 1',
    [idfacultad]
  );
  return rows[0];
};

exports.obtenerImportePorTipoFacultad = async (tipoFacultadId) => {
  const [rows] = await conexion.promise().query(
    'SELECT idimporte, montopesos, cantidadCuota FROM importe WHERE tipoFacultad_idtipoFacultad = ? LIMIT 1',
    [tipoFacultadId]
  );
  return rows[0];
};

exports.guardarFormaPago = async (cuotaFinal, idinscripcion, idpersona, idimporte) => {
  const [result] = await conexion.promise().query(
    `INSERT INTO formapago
      (fechaInicio, cuotaFinal, detalle, persona_idpersona, importe_idimporte, habilitado) 
     VALUES (NOW() - INTERVAL 3 HOUR, ?, ?, ?, ?, 1)`,
    [cuotaFinal, idinscripcion, idpersona, idimporte]
  );
  return result.insertId;
};

exports.obtenerAulaYCapacidad = async (idmateria) => {
  const [rows] = await conexion.promise().query(
    `SELECT a.idaula, a.capacidad 
     FROM materia m 
     JOIN aula a ON m.aula_idaula = a.idaula 
     WHERE m.idmateria = ? LIMIT 1`,
    [idmateria]
  );
  return rows[0];
};

exports.contarInscriptosMateria = async (idmateria) => {
  const [rows] = await conexion.promise().query(
    `SELECT COUNT(*) AS cantidad 
     FROM inscripcion 
     WHERE JSON_EXTRACT(detalle, '$.idmateria') = ? AND habilitado = 1`,
    [idmateria]
  );
  return rows[0].cantidad;
};

exports.deshabilitarMateria = async (idmateria) => {
  await conexion.promise().query(
    `UPDATE materia SET habilitado = 0 WHERE idmateria = ?`,
    [idmateria]
  );
};

exports.obtenerMateriasPorFacultad = async (idFacultad) => {
  const [materias] = await conexion.promise().query(
    'SELECT idmateria, materia FROM materia WHERE facultad_idfacultad = ? AND habilitado = 1',
    [idFacultad]
  );
  return materias;
};

exports.obtenerProvinciaPersona = async (idpersona) => {
  const [rows] = await conexion.promise().query(
    'SELECT provincia_idprovincia FROM persona WHERE idpersona = ? LIMIT 1',
    [idpersona]
  );
  return rows[0];
};

exports.obtenerNombreProvincia = async (idprovincia) => {
  const [rows] = await conexion.promise().query(
    'SELECT nombreProvincia FROM provincia WHERE idprovincia = ? LIMIT 1',
    [idprovincia]
  );
  return rows[0]?.nombreProvincia?.toLowerCase() || '';
};

exports.obtenerMateriasPorProvincia = async (idfacultad, tipoAulaCond) => {
  const [materias] = await conexion.promise().query(
    `SELECT m.idmateria, m.materia, a.tipoAula
     FROM materia m
     JOIN aula a ON m.aula_idaula = a.idaula
     WHERE m.facultad_idfacultad = ? AND m.habilitado = 1 AND (${tipoAulaCond})`,
    [idfacultad]
  );
  return materias;
};

exports.guardarRecibo = async (metodoPago, montoPagado, detalle, idformapago, comprobanteJson) => {
  await conexion.promise().query(
    `INSERT INTO recibo 
      (fechaRecibo, metodoPago, montoPagado, detalle, habilitado, formapago_idformapago, comprobante) 
     VALUES (NOW() - INTERVAL 3 HORA, ?, ?, ?, 1, ?, ?)`,
    [metodoPago, montoPagado, detalle, idformapago, comprobanteJson]
  );
};

exports.obtenerFormapago = async (idformapago) => {
  const [rows] = await conexion.promise().query(
    'SELECT detalle, persona_idpersona FROM formapago WHERE idformapago = ?',
    [idformapago]
  );
  return rows[0];
};

exports.obtenerInscripcionPorId = async (idinscripcion) => {
  const [rows] = await conexion.promise().query(
    'SELECT idinscripcion FROM inscripcion WHERE idinscripcion = ?',
    [idinscripcion]
  );
  return rows[0];
};

exports.habilitarInscripcion = async (idinscripcion) => {
  await conexion.promise().query(
    'UPDATE inscripcion SET habilitado = 1 WHERE idinscripcion = ?',
    [idinscripcion]
  );
};

exports.obtenerPersonaCorreo = async (idpersona) => {
  const [rows] = await conexion.promise().query(
    'SELECT correo, nombre FROM persona WHERE idpersona = ?',
    [idpersona]
  );
  return rows[0];
};
