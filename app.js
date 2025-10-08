const express = require('express');
const { use } = require('./router');
const app = express();
const path = require('path');
const port=3000;

app.set('view engine', 'ejs');

app.use(express.urlencoded({extended:false}));
app.use(express.json());

const cookieParser = require('cookie-parser');

app.use(cookieParser()); 

app.set('view engine', 'ejs'); 

// Sirve la carpeta 'doc' como estática
app.use('/doc', express.static(path.join(__dirname, 'doc')));

app.use('/', require('./router'));
//app.use('/usuaryincrip', require('./router'));

app.listen(port, () => {
    console.log('Server corriendo en http://localhost:3000/');
});

