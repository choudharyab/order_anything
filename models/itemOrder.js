var Model = require('./base');
var FoodCategory=require('./foodCategory');
var ItemOrder = Model.extend({
    
    tableName: 'Item_order',
    hasTimestamps: true,


     food_category:function()
    {
    	return this.belongsTo(FoodCategory,'item_id');
    }


});

module.exports = ItemOrder;