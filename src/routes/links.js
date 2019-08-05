const express = require('express');
const router = express.Router();

var cloudinary = require('cloudinary');


const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');

cloudinary.config({
    cloud_name:'dyhowxkye',
    api_key: '739723474219958',
    api_secret: 'jQttMABV1zBRO8jkQ3_FAiRhkrE'
  });

router.get('/add', (req, res) => {
    res.render('links/add');
});

router.get('/create', function(req, res, next) {
    res.render('links/create', { title: 'Agregar Zapato',index: ''});
});

router.post('/create', async (req, res, next) => {
    var { title, description, price, image, stock } = req.body;
    var result = await cloudinary.v2.uploader.upload(req.file.path);
    var dataproducts = new Object();
    dataproducts.title = title;
    dataproducts.description = description;
    dataproducts.price = price;
    dataproducts.image = result.url,
    dataproducts.stock = stock;
    await pool.query('INSERT INTO products set ?',[dataproducts]);
    console.log("hecho")
    res.redirect('/links/list');
  });

router.post('/add', async (req, res) => {
    const { title, url, description } = req.body;
    const newLink = {
        title,
        url,
        description,
        user_id: req.user.id
    };
    await pool.query('INSERT INTO links set ?', [newLink]);
    req.flash('success', 'Link Saved Successfully');
    res.redirect('/links');
});

router.get('/list', async (req, res) => {
    const data = await pool.query('SELECT * FROM products');
    console.log(data);
    res.render('links/list', { data, title:"Administración", index: " ", adminyuc: 'active' });
});


router.get('/info', async (req, res) => {
    const data = await pool.query('select u.username, c.user, c.total, DATE_FORMAT(c.fecha, "%d-%m-%Y") as fecha, count(id) as p from users u, cart c where c.user = u.id group by u.username');
    console.log(data);
    res.render('links/info', { data, title:"Compras en la pagina", index: " ", adminyu: 'active' });
});

router.get('/compra/:id', async (req, res) => {
    var { id } = req.params; 
    const data = await pool.query('select p.title, p.image, p.price from cart c, products p where p.id = c.product and user = ?',[id]);
    console.log(data);
    res.render('links/compra', { data, title:"Productos de la compra", index: " ", adminyu: 'active' });
});

router.get('/delete/:id', async (req, res) => {
    const { id } = req.params;
    await pool.query('DELETE FROM products WHERE Id = ?', [id]);
    
    res.redirect('/links/list');
});

router.get('/edit/:id', async (req, res) => {
    const { id } = req.params;
    const links = await pool.query('SELECT * FROM products WHERE id = ?', [id]);
    console.log(links);
    res.render('links/edit', {data: links[0], title: "Editar Zapatos", index: ""});
});

router.post('/edit/:id', async (req, res) => {
        var { id, image } = req.params;
    var data = req.body;
    console.log(image);
    if(req.file  != null){
        var { id, title, description, price, image, stock } = req.body;
        var result = await cloudinary.v2.uploader.upload(req.file.path);
        var dataproducts = new Object();
        dataproducts.title = title;
        dataproducts.description = description;
        dataproducts.price = price;
        dataproducts.image = result.url,
        dataproducts.stock = stock;
        var dt = dataproducts;
        console.log("qaaaaa aqui");
    }else{
        var dataproductsx = new Object();
        dataproductsx.title = data.title;
        dataproductsx.description = data.description;
        dataproductsx.price = data.price;
        dataproductsx.image = data.imagenurl,
        dataproductsx.stock = data.stock;
        var dt = dataproductsx;
    }
    await pool.query('UPDATE products set ? WHERE id = ?', [dt,id]);
    
    res.redirect('/links/list');
});

module.exports = router;