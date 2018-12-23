var Model = require('./base');
var FoodAddress = Model.extend({
    
    tableName: 'food_with_address',
    hasTimestamps: true,

    

});

module.exports = FoodAddress;