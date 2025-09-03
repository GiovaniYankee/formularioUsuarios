const express = require('express');
const { use } = require('./router');
const app = express();
const port=3000;

app.set('view engine', 'ejs');

app.use(express.urlencoded({extended:false}));
app.use(express.json());

app.use('/', require('./router'));
//app.use('/usuaryincrip', require('./router'));

app.listen(port, () => {
    console.log('Server coriendo en http://localhost:3000');
});