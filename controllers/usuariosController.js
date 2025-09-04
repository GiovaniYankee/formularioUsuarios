const db = require('../database/db');



exports.vistaUsuarios = async (req, res) => {
  const [personas] = await db.promise().query(`
    SELECT idpersona, apellido, nombre, tipoDocumento, numDocumento, cuil, fechaNacimiento, correo, telefono, direccion, pais_idpais, provincia_idprovincia, localidad, fechaAlta, genero, tipoPersona_idtipoPersona, situacion, habilitado
    FROM persona
    ORDER BY apellido ASC, nombre ASC
  `);
  res.render('usuarios', { personas });
};

exports.editarPersona = async (req, res) => {
  const {
    idpersona, apellido, nombre, tipoDocumento, numDocumento, cuil, fechaNacimiento,
    correo, telefono, direccion, pais_idpais, provincia_idprovincia, localidad,
    fechaAlta, genero, tipoPersona_idtipoPersona, situacion, habilitado
  } = req.body;
  await db.promise().query(`
    UPDATE persona SET apellido=?, nombre=?, tipoDocumento=?, numDocumento=?, cuil=?, fechaNacimiento=?, correo=?, telefono=?, direccion=?, pais_idpais=?, provincia_idprovincia=?, localidad=?, fechaAlta=?, genero=?, tipoPersona_idtipoPersona=?, situacion=?, habilitado=?
    WHERE idpersona=?
  `, [apellido, nombre, tipoDocumento, numDocumento, cuil, fechaNacimiento, correo, telefono, direccion, pais_idpais, provincia_idprovincia, localidad, fechaAlta, genero, tipoPersona_idtipoPersona, situacion, habilitado, idpersona]);
  res.redirect('/personas');
};