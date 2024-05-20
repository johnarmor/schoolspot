const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const app = express();

app.use(bodyParser.json());

const db = mysql.createConnection({
  host: 'romrarito.helioho.st',
  user: 'romrarito_user2',
  password: 'johnarmor69',
  database: 'romrarito_schoolspot'
});

db.connect(err => {
  if (err) {
    console.error('Error connecting to the database:', err.stack);
    return;
  }
  console.log('Connected to the database.');
});

app.post('/register', (req, res) => {
  const { full_name, email, password } = req.body;
  const sql = 'INSERT INTO users (full_name, email, password) VALUES (?, ?, ?)';
  db.query(sql, [full_name, email, password], (err, result) => {
    if (err) {
      res.status(500).send('Error registering user');
      return;
    }
    res.status(200).send('User registered successfully');
  });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
