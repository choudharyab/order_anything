var knex = {
	client: 'mysql',
	
    connection: {
	    host     : 'localhost',
	    user     : 'root',
	    password : '',
	    database : 'db_order_anything'
    },
    migrations: {
        tableName: 'knex_migrations'
	},
	pool: { min: 0, max: 7 }
	
};

module.exports = knex;

