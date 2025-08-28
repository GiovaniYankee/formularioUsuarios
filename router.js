const express = require('express');
const router = express.Router();
const conexion=require('./database/db');


const raizController = require('./controllers/raizController');

const inscripcionController = require('./controllers/inscripcionController');

const formacionContinuaController = require('./controllers/formacionContinuaController');

const cooperadoraController = require('./controllers/cooperadoraController');

const coopDeudoresController = require('./controllers/coopDeudoresController');

const aulasController = require('./controllers/aulasController');

const materiaController = require('./controllers/materiasController');

router.get('/', (req, res) => {
  res.render('mantenimiento');
});
//Rutas Raiz
router.get('/IES_9-024', raizController.vistaIndex);

//Rutas Materias
router.get('/IES_9-024/materias', materiaController.vistaMaterias);
router.post('/IES_9-024/materias/update', materiaController.actualizarMateria);

//Rutas Aula
router.get('/IES_9-024/aulas', aulasController.vistaAula);
router.post('/IES_9-024/aulas/update', aulasController.actualizarAula);

//Rutas Formacion Continua
router.get('/IES_9-024/formacion-continua', formacionContinuaController.vistaFormacionContinua);
router.post('/IES_9-024/inscripcion/deshabilitar', formacionContinuaController.deshabilitarInscripcion);
router.post('/IES_9-024/inscripcion/habilitar', formacionContinuaController.habilitarInscripcion);

//Rutas cooperadora
router.get('/IES_9-024/cooperadora', cooperadoraController.vistaCooperadora);
router.post('/IES_9-024/cooperadora/actualizar-estado-recibo', cooperadoraController.actualizarEstadoRecibo);
router.get('/IES_9-024/cooperadora/deudores', coopDeudoresController.vistaDeudores);
router.post('/IES_9-024/cooperadora/deudores/eliminar', coopDeudoresController.eliminarDeuda);
router.post('/IES_9-024/cooperadora/deudores/habilitar', coopDeudoresController.habilitarDeuda);

//Rutas Inscripcion
router.get('/IES_9-024/inscripcion', inscripcionController.vistaInscripcion);
router.post('/IES_9-024/persona/buscar', inscripcionController.buscarPersona);
router.post('/IES_9-024/persona/guardar', inscripcionController.guardarPersona);
router.post('/IES_9-024/inscripcion/guardar', inscripcionController.guardarInscripcion);
router.get('/IES_9-024/facultad/:idFacultad/materias', inscripcionController.materiasPorFacultad);
router.get('/IES_9-024/materias-por-provincia/:idpersona/:idfacultad', inscripcionController.materiasPorProvincia);
router.post('/IES_9-024/inscripcion/finalizar', inscripcionController.finalizarInscripcion);

module.exports = router;
