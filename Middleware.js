const jwt = require('jsonwebtoken');

function verificarToken(req, res, next) {
  const token = req.cookies.token; // 🔥 Se toma desde la cookie
  if (!token) return res.status(401).send('Token requerido');

  jwt.verify(token, 'CLAVE_SECRETA', (err, decoded) => {
    if (err) return res.status(401).send('Token inválido');
    req.usuario = decoded;
    next();
  });
}

module.exports = verificarToken;
