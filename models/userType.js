var Model = require('./base');

var UserType = Model.extend({
    
    tableName: 'user_types',
    hasTimestamps: true

});

module.exports = UserType;