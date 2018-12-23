var OrderStage = require('../models/orderStage');
var Order=require('../models/order');
var ItemOrder=require('../models/itemOrder');
var FoodCategory=require('../models/foodCategory');
var User=require('../models/user');
var UserType=require('../models/userType');
/*******************order created  function***************************************/
module.exports.createOrder=function(req,res)
{
    console.log(req.body);
    var item = req.body.data;
    
 OrderStage.forge({order_stages:req.body.order_stages}).fetch().then(function(orderstage){
 	Order.forge({
 		order_stages_id:orderstage.id,
 		customer_id:req.body.customer_id
 	})
    .save()
    .then(function(addedorder){
        for(var i=0;i<item.length;i++){
        	
        	var quantity1=item[i].quantity;
        	FoodCategory.forge({food_name:item[i].item}).fetch().then(function(category){
        		
            ItemOrder.forge({
                order_id: addedorder.id,
                item_id: category.id,
                quantity:quantity1
            })
            .save()
            .then(function(a){
             
            })
            })
        }
        res.json({
            type: true,
            data: addedorder
        });
    })

 })
    
    .catch(function(err){
        console.log(err.message);
        res.status(400).json({error: err.message});
    });
}


/***************GET ALL orders******************************/
module.exports.getAllOrders = function(req, res){
    Order.forge()
        .orderBy('id', 'ASC')
        .fetchAll({withRelated:['order_array.food_category.food_with_address','order_stage']})
        .then(function(order){
            res.json({
                type: true,
                data: order
            });
        }).catch(function(err){
            console.log(err.stack);
            res.status(400).json({error: err.message});
        });
};

/***************GET ALL Orders by filter******************************/
module.exports.getAllOrdersByFilter = function(req, res){
    //Order.forge()
     Order.query(function(u){
        u.leftJoin('order_stages','orders.order_stages_id','order_stages.id')
        u.where('order_stages.order_stages',req.params.order_status)
        u.orderBy('id', 'ASC')
         }) 
        .fetchAll({withRelated:['order_array.food_category.food_with_address','order_stage']})
        .then(function(order){
            res.json({
                type: true,
                data: order
            });
        }).catch(function(err){
            console.log(err.stack);
            res.status(400).json({error: err.message});
        });
};

/***************Assign order by admin******************************/
module.exports.assignOrder=function(req,res)
{
	console.log(req.params);
   User.query(function(u){
        u.leftJoin('user_types','users.user_type_id','user_types.id')
        //u.where('user_types.role','Delivery Person')
        u.where('users.phone_no',req.params.phone_no)
        u.orderBy('id', 'ASC')
        }) 
       .fetch()
        .then(function(user){
        	//console.log(user);
        	 Order.forge({id:req.params.order_id})
        	      .fetch()
    			  .then(function(order1){
    			  	if(order1){
    			  		console.log(user.id);
            			order1.save({
                		delivery_person_id:user.id
            			})
           				 .then(function(order2){
                // res.json({
                //     type: true,
                //     data: order2
                // });
            });
        }else{
            res.json({
                type: false,
                error: 'order having id ' + req.params.order_id +' does not exist'
            });
        }
    			  	 });
            res.json({
                type: true,
                data: "Order Assigned Successfully"
            });
        }).catch(function(err){
            console.log(err.stack);
            res.status(400).json({error: err.message});
        });
}

/***************************update order status****************************************/
   module.exports.updateOrderStatus=function(req,res)
   {
     console.log(req.params);
   	 Order.forge({id:req.params.order_id})
        	      .fetch()
    			  .then(function(order1){
    			  	OrderStage.forge({order_stages:req.params.order_stages})
                              .fetch()
    			  	    	  .then(function(orderstage){
                                  
                              		order1.save({
                						order_stages_id:orderstage.id
            							})
                                
    			  	    		})
    			  		 		res.json({
                					type: true,
                					data: "Order Status Updated Successfully"
            					});	 
       
    			  	 }).catch(function(err){
            console.log(err.stack);
            res.status(400).json({error: err.message});
        });
   }