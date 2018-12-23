var express = require('express');
var router = express.Router();

var orderController = require('../controllers/order.controller');

router.post('/create', orderController.createOrder);

 router.get('/updateOrderStatus/:order_id/:order_stages', orderController.updateOrderStatus);

 router.get('/getAllOrder',orderController.getAllOrders);

 router.get('/getAllOrdersByFilter/:order_status',orderController.getAllOrdersByFilter);

 router.get('/assignOrder/:phone_no/:order_id',orderController.assignOrder);


module.exports = router;