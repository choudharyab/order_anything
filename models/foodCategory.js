var Model = require('./base');
var FoodAddress=require('./foodAddress');
var FoodCategory = Model.extend({
    
    tableName: 'food_with_categories',
    hasTimestamps: true,

     food_with_address:function()
    {
    	return this.hasMany(FoodAddress,'food_with_category_id');
    },

});

module.exports = FoodCategory;