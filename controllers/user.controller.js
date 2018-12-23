var User = require('../models/user');
var UserType=require('../models/userType');
var _ = require('underscore');
var jwt = require('jsonwebtoken');
var keys = require('../init/keys');

/***************Login Function********************************/
module.exports.checkCredentials = function(req, res){
    User.forge({ phone_no: req.body.phone_no, password: req.body.password})
        .fetch({ withRelated: ['user_type']})
        .then(function(user){
            if(user){
                var userToken = jwt.sign(_.extend(_.omit(user.attributes, 'password')), keys.jwt.userSecretKey);         
                res.json({
                    type: true,
                    token: userToken,
                    data:user
                });
            }else{
                res.json({
                    type:false,
                    error: 'Incorrect phone_no or password'
                });
            }
        })
        .catch(function(err){
            console.log(err.stack);
            res.status(400).json({error: err.message});
    });
};


/******************Registration Function*****************************/
module.exports.signUp=function(req,res)
{
     User.forge({ phone_no: req.body.phone_no})
    .fetch()
    .then(function(user){
        console.log(user);
        if(user){         
            res.json({
                type: false,
                error: 'It looks like you have already registered using this phone_no'
            });
        }else{
            UserType.forge({ role: req.body.role})
                    .fetch()
                    .then(function(user1){
                        console.log(user1.id);
            User.forge({
                phone_no:req.body.phone_no,
                password:req.body.password,
                user_type_id:user1.id
                

            })
            .save()
            .then(function(addedUser){
                res.json({
                    type:true,
                    data:addedUser
                });
            })
            })
        }
    })
    .catch(function(err){
        console.log(err.stack);
        res.status(400).json({error: err.message});
    });
}
/***************GET ALL USERS******************************/
module.exports.getAllUsers = function(req, res){
    User.forge()
        .orderBy('id', 'ASC')
        .fetchAll()
        .then(function(users){
            res.json({
                type: true,
                data: users
            });
        }).catch(function(err){
            console.log(err.stack);
            res.status(400).json({error: err.message});
        });
};