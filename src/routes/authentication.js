const express = require('express');
const router = express.Router();

const pool = require('../database');

const passport = require('passport');
const { isLoggedIn } = require('../lib/auth');
var currencyFormatter = require('currency-formatter');

// SIGNUP
router.get('/signup', async (req, res) => {
  const carrito =  await pool.query('select count(*) as c from cart where pay = 0');
  res.render('auth/signup', { title: "Crear Cuenta",carrito: carrito[0].c });
});

router.post('/signup', passport.authenticate('local.signup', {
  successRedirect: '/',
  failureRedirect: '/signup',
  failureFlash: true
}));

// SINGIN
router.get('/signin',async  (req, res) => {
  const carrito =  await pool.query('select count(*) as c from cart where pay = 0');
  res.render('auth/signin',{ title: "Iniciar Sesión", carrito: carrito[0].c });
});

router.post('/signin', (req, res, next) => {
  req.check('username', 'Username is Required').notEmpty();
  req.check('password', 'Password is Required').notEmpty();
  const errors = req.validationErrors();
  if (errors.length > 0) {
    req.flash('message', errors[0].msg);
    res.redirect('/signin');
  }
  passport.authenticate('local.signin', {
    successRedirect: '/',
    failureRedirect: '/signin',
    failureFlash: true
  })(req, res, next);
});

router.get('/logout', (req, res) => {
  req.logOut();
  res.redirect('/');
});

router.get('/profile', isLoggedIn, async (req, res) => {
  var sql = await pool.query('select * from cart where pay = 0');
  var t = sql[0].total;
  var total  = currencyFormatter.format(t, { locale: 'en-US' });
  console.log(total);
  var ts =  total.substring(1,1000);
  
  res.render('profile', { title: "Paso final", total, ts, carrito: '0' });
});

router.get('/tanks/:id' , async (req, res) => {
var { id } = req.params;
 
 var sql = await pool.query('select sum(total) as total from cart where pay = 0');
 var t = sql[0].total;
 var sql = await pool.query('UPDATE cart SET pay = 1, user = ? , total = ? where pay = 0',[id,t]);
  
  res.render('tanks', { title: "Paso final", carrito: '0'});
});

router.get('/cart',isLoggedIn, async (req, res) => {
  const data = await pool.query('select * from products p, cart c where p.id = c.product and c.pay = 0');
  const carrito =  await pool.query('select count(*) as c from cart where pay = 0');
  res.render('cart', {data, title: 'Carrito de compras', car: 'active', carrito: carrito[0].c });
});


router.post('/pay',async (req, res) => {
  var { total, user } = req.body;
  console.log(total);
  var sql = await pool.query('UPDATE cart SET total = ? where pay = 0',[total]);
  console.log(req.body);
  res.redirect('/profile')
})

router.get('/products', async (req, res) => {
  var { min } = req.params;
  console.log(min);
  const data = await pool.query('SELECT * FROM products');
  const carrito = await pool.query('select count(*) as c from cart where pay = 0');
  res.render('products',{index: '', products: 'active', title: 'Productos', data, carrito: carrito[0].c });
});

router.post('/products', async (req, res) => {
  var { min, max } = req.body;
  if(min != null && max != null){
    var data = await pool.query('SELECT * FROM products  where price >= ? and price <= ?',[min,max]);
  }else{
    var data = await pool.query('SELECT * FROM products');
  }
  const carrito =  await pool.query('select count(*) as c from cart where pay = 0');
  res.render('products',{index: '', products: 'active', title: 'Productos', data, carrito: carrito[0].c});
});

router.get('/information/:id', async (req, res) => {
  var { id } = req.params;
  const links = await pool.query('SELECT * FROM products WHERE id = ?', [id]);
  const carrito =  await pool.query('select count(*) as c from cart where pay = 0');
  res.render('information',{data: links[0], index: 'Descripción', products: 'active', title: 'Productos', carrito: carrito[0].c});
});

router.get('/deletec/:id', async (req, res) => {
  
  const { id } = req.params;
  console.log(id);
  await pool.query('DELETE FROM cart WHERE product = ? and pay = 0 ', [id]);
  
  res.redirect('/cart');
});

router.post('/information/:id', async (req, res) => {
  var { id } = req.params;
  var dat = new Object();
  dat.product = id;
  await pool.query('INSERT INTO cart set ?',[dat]);
  res.redirect('/products')
});


router.post('/addcarrito/:id', async (req, res) => {
  var { id } = req.params;
  var dat = new Object();
  dat.product = id;
  await pool.query('INSERT INTO cart set ?',[dat]);
  res.redirect('/products')
});





module.exports = router;
