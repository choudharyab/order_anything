var express = require('express');
var bodyParser =  require('body-parser');
var path = require('path');
var ejs = require('ejs');
var keys = require('../init/keys');
var userRoutes=require('../routes/user.routes');
var orderRoutes=require('../routes/order.routes');
var app = express();

app.use(function(req, res, next) {
    res.setHeader("Access-Control-Allow-Origin", "*");
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
    res.setHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Authorization,Content-Type, Accept");
    res.setHeader('Access-Control-Allow-Credentials', true);
    next();
});

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, '../public')));
app.set('view engine', 'hjs');



app.use('/api/users',userRoutes);
app.use('/api/orders',orderRoutes);


app.set('port', process.env.PORT || 3000);





module.exports = app;
