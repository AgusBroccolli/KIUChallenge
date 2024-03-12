const express = require('express');
const mysql = require('mysql');

const app = express();
const HOST = process.env.HOST || '';
const PORT = process.env.PORT || '';
const USERNAME = process.env.USERNAME || '';
const PASSWORD = process.env.PASSWORD || '';

const connection = mysql.createConnection({
  host: HOST,
  port: PORT,
  user: USERNAME,
  password: PASSWORD
});

connection.connect();

app.get('/', (req, res) => {
  connection.query('SELECT * FROM users', (error, results, fields) => {
    if (error) throw error;
    res.json(results);
  });
});

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
