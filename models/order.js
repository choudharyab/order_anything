var Model = require('./base');
var OrderStage=require('./orderStage');
var ItemOrder=require('./itemOrder');
var Order = Model.extend({
    
    tableName: 'orders',
    hasTimestamps: true,

 order_array:function()
    {
    	return this.hasMany(ItemOrder,'order_id');
    },


     order_stage:function()
    {
    	return this.belongsTo(OrderStage,'order_stages_id');
    }
   
});

module.exports = Order;