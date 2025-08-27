const express = require('express');
const router = express.Router();
const conexion=require('./database/db');


const raizController = require('./controllers/raizController');

const inscripcionController = require('./controllers/inscripcionController');

const formacionContinuaController = require('./controllers/formacionContinuaController');

const cooperadoraController = require('./controllers/cooperadoraController');
router.get('/', (req, res) => {
  res.render('mantenimiento');
});

router.get('/IES_9-024', raizController.vistaIndex);
router.get('/IES_9-024/formacion-continua', formacionContinuaController.vistaFormacionContinua);
router.get('/IES_9-024/cooperadora', cooperadoraController.vistaCooperadora);

router.get('/IES_9-024/inscripcion', inscripcionController.vistaInscripcion);
router.post('/IES_9-024/persona/buscar', inscripcionController.buscarPersona);
router.post('/IES_9-024/persona/guardar', inscripcionController.guardarPersona);
router.post('/IES_9-024/inscripcion/guardar', inscripcionController.guardarInscripcion);
router.get('/IES_9-024/facultad/:idFacultad/materias', inscripcionController.materiasPorFacultad);
router.get('/IES_9-024/materias-por-provincia/:idpersona/:idfacultad', inscripcionController.materiasPorProvincia);

//router.get('/savecategoria', inscripcionController.saveCategoria);
router.post('/IES_9-024/inscripcion/finalizar', inscripcionController.finalizarInscripcion);
router.post('/IES_9-024/cooperadora/actualizar-estado-recibo', cooperadoraController.actualizarEstadoRecibo);

module.exports = router;
