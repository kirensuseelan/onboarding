const mysql = require('mysql');


const db = mysql.createConnection ({
    host: 'localhost',
    port:3306,
    user: 'root',
    password: 'Password@123',
    database: 'onboarding'
});



// connect to database
db.connect((err) => {
    if (err) {
        throw err;
    }
    console.log('Connected to database');
});

module.exports=db;