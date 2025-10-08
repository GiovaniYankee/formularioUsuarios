const express = require('express');
const router = express.Router();
const jwt = require('jsonwebtoken');
const verificarToken = require('./Middleware');
const conexion = require('./database/db');

// ✅ Login público
router.post('/login', (req, res) => {
  const { clave } = req.body;
  let tipo = null;

  if (clave === 'formacion2025') tipo = 'formacion';
  else if (clave === 'coope2025') tipo = 'cooperadora';

  if (!tipo) return res.status(401).json({ mensaje: 'Clave incorrecta' });

  const token = jwt.sign({ tipo }, 'CLAVE_SECRETA', { expiresIn: '2h' });

  // 🔒 Guardamos el token como cookie segura
  res.cookie('token', token, {
    httpOnly: true, // No accesible desde JS
    secure: false,  // true si usás HTTPS
    maxAge: 2 * 60 * 60 * 1000 // 2 horas
  });

  res.json({ tipo });
});

// ✅ Logout (opcional)
router.post('/logout', (req, res) => {
  res.clearCookie('token');
  res.json({ mensaje: 'Sesión cerrada' });
});

// Controladores
const raizController = require('./controllers/raizController');
const inscripcionController = require('./controllers/inscripcionController');
const formacionContinuaController = require('./controllers/formacionContinuaController');
const cooperadoraController = require('./controllers/cooperadoraController');
const coopDeudoresController = require('./controllers/coopDeudoresController');
const aulasController = require('./controllers/aulasController');
const materiaController = require('./controllers/materiasController');
const asistenciaController = require('./controllers/asistenciaController');
const lectorController = require('./controllers/lectorController');
const usuariosController = require('./controllers/usuariosController');

// ✅ Ruta pública (login)
router.get('/IES_9-024', raizController.vistaIndex);

// ✅ Rutas protegidas (requieren token)
router.get('/IES_9-024/formacion-continua', verificarToken, formacionContinuaController.vistaFormacionContinua);
router.get('/IES_9-024/cooperadora', verificarToken, cooperadoraController.vistaCooperadora);

// Materias
router.get('/IES_9-024/materias', verificarToken, materiaController.vistaMaterias);
router.post('/IES_9-024/materias/update', verificarToken, materiaController.actualizarMateria);

// Aulas
router.get('/IES_9-024/aulas', verificarToken, aulasController.vistaAula);
router.post('/IES_9-024/aulas/update', verificarToken, aulasController.actualizarAula);

// Formacion Continua
router.post('/IES_9-024/inscripcion/deshabilitar', verificarToken, formacionContinuaController.deshabilitarInscripcion);
router.post('/IES_9-024/inscripcion/habilitar', verificarToken, formacionContinuaController.habilitarInscripcion);

// Cooperadora
router.post('/IES_9-024/cooperadora/actualizar-estado-recibo', verificarToken, cooperadoraController.actualizarEstadoRecibo);
router.get('/IES_9-024/cooperadora/deudores', verificarToken, coopDeudoresController.vistaDeudores);
router.post('/IES_9-024/cooperadora/deudores/eliminar', verificarToken, coopDeudoresController.eliminarDeuda);
router.post('/IES_9-024/cooperadora/deudores/habilitar', verificarToken, coopDeudoresController.habilitarDeuda);
router.post('/IES_9-024/cooperadora/verificar-todos', verificarToken, cooperadoraController.verificarTodos);
router.post('/IES_9-024/cooperadora/deudores/actualizar', verificarToken, coopDeudoresController.actualizarDetalle);

// Inscripción
router.get('/IES_9-024/inscripcion', verificarToken, inscripcionController.vistaInscripcion);
router.post('/IES_9-024/persona/buscar', verificarToken, inscripcionController.buscarPersona);
router.post('/IES_9-024/persona/guardar', verificarToken, inscripcionController.guardarPersona);
router.post('/IES_9-024/inscripcion/guardar', verificarToken, inscripcionController.guardarInscripcion);
router.get('/IES_9-024/facultad/:idFacultad/materias', verificarToken, inscripcionController.materiasPorFacultad);
router.get('/IES_9-024/materias-por-provincia/:idpersona/:idfacultad', verificarToken, inscripcionController.materiasPorProvincia);
router.post('/IES_9-024/inscripcion/finalizar', verificarToken, inscripcionController.finalizarInscripcion);

// Asistencia
router.get('/IES_9-024/asistencia', verificarToken, asistenciaController.vistaAsistencia);
router.post('/IES_9-024/asistencia/crear-o-actualizar', verificarToken, asistenciaController.crearOActualizarRegistrosAsistencia);
router.get('/IES_9-024/asistencia/lector', verificarToken, lectorController.vistaLector);
router.get('/IES_9-024/lector/buscar/:idinscripcion', verificarToken, lectorController.buscarPorInscripcion);
router.get('/IES_9-024/lector/buscar-dni/:dni', verificarToken, lectorController.buscarPorDNI);
router.post('/IES_9-024/lector/actualizar-a1', verificarToken, lectorController.actualizarA1);

router.post('/notificar-asistencia', verificarToken, async (req, res) => {
  await asistenciaController.enviarCorreosPendientes();
  res.redirect('/IES_9-024/asistencia');
});

// Usuarios
router.get('/IES_9-024/usuarios', verificarToken, usuariosController.vistaUsuarios);
router.post('/personas/editar', verificarToken, usuariosController.editarPersona);

module.exports = router;
