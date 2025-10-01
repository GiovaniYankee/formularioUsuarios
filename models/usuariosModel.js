const db = require('../database/db');

exports.obtenerPersonas = () => {
  return db.promise().query(`
    SELECT idpersona, apellido, nombre, tipoDocumento, numDocumento, cuil, fechaNacimiento, correo, telefono, direccion, pais_idpais, provincia_idprovincia, localidad, fechaAlta, genero, tipoPersona_idtipoPersona, situacion, habilitado
    FROM persona
    ORDER BY apellido ASC, nombre ASC
  `);
};

exports.actualizarPersona = (persona) => {
  const {
    idpersona, apellido, nombre, tipoDocumento, numDocumento, cuil, fechaNacimiento,
    correo, telefono, direccion, pais_idpais, provincia_idprovincia, localidad,
    fechaAlta, genero, tipoPersona_idtipoPersona, situacion, habilitado
  } = persona;

  return db.promise().query(`
    UPDATE persona SET apellido=?, nombre=?, tipoDocumento=?, numDocumento=?, cuil=?, fechaNacimiento=?, correo=?, telefono=?, direccion=?, pais_idpais=?, provincia_idprovincia=?, localidad=?, fechaAlta=?, genero=?, tipoPersona_idtipoPersona=?, situacion=?, habilitado=?
    WHERE idpersona=?
  `, [apellido, nombre, tipoDocumento, numDocumento, cuil, fechaNacimiento, correo, telefono, direccion, pais_idpais, provincia_idprovincia, localidad, fechaAlta, genero, tipoPersona_idtipoPersona, situacion, habilitado, idpersona]);
};
