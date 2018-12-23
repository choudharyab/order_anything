var Model = require('./base');
var UserType=require('../models/userType');
var User = Model.extend({
    
    tableName: 'users',
    hasTimestamps: true,

     user_type:function()
    {
    	return this.belongsTo(UserType,'user_type_id');
    }

});

module.exports = User;