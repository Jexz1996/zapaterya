const express = require('express');
const router = express.Router();
const pool = require('../database');
router.get('/', async (req, res) => {
    const carrito =  await pool.query('select count(*) as c from cart where pay = 0');
    const p = await pool.query('select  p.title, p.image, p.price, c.product, count(c.product) as cc from cart c, products p  where c.product = p.id  group by c.product order by cc desc LIMIT 5');
    res.render('index', { title: "Inicio", index: "active", carrito: carrito[0].c, p});
});

module.exports = router;