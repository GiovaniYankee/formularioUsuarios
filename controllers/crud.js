const conexion =require('../database/db');

exports.savecategoria =(req,res)=>{
    const tipofacultad = req.body.tipofacultad;
    const item = req.body.item === 'true';

    conexion.query('INSERT INTO tipofacultad SET ?', { tipoFacultad: tipofacultad,habilitado:'1', Inscripcion: item }, (error, results) => {
        if (error) {
            console.log(error);
        } else {
            res.redirect('/formacion');
        }
    });

    console.log(tipofacultad + " - " + item);
};
