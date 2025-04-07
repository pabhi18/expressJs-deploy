import mysql from 'mysql';
import dotenv from 'dotenv';

dotenv.config();
const db = mysql.createConnection({
  host: process.env.HOST,
  user: process.env.MYSQL_USER,
  password: process.env.PASSWORD,
  database: process.env.DATABASE,
});

export default db;
