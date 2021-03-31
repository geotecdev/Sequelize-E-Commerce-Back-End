require('dotenv').config();

const Sequelize = require('sequelize');


const sequelize = new Sequelize(process.env.DB_NAME, process.env.DB_USER, process.env.DB_PW, {
    host: 'menardelbowweartracking3.database.windows.net',
    dialect: 'mssql', //postgres'|'sqlite'|''|'mysql',
    dialectOptions: {
        options: { encrypt: true }
    }
});

module.exports = sequelize;