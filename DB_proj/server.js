const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const path = require('path');
const cors = require('cors');

const app = express();
const port = 3000;

app.use(cors());
app.use(bodyParser.json());

// MySQL database connection
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'aliza1092',
  database: 'CrimeRecordDB'
});

// Connect to the database
db.connect((err) => {
  if (err) {
    console.error('Database connection failed:', err);
    return;
  }
  console.log('Connected to CrimeRecordDB database.');
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});

app.get('/users', (req, res) => {
  db.query('SELECT LoginID, Username, Role FROM LoginCredentials', (err, results) => {
    if (err) return res.status(500).send('Error fetching users');
    res.json(results);
  });
});

app.post('/login', (req, res) => {
  const { username, password } = req.body;

  db.query(
    'SELECT * FROM LoginCredentials WHERE Username = ? AND Password = ?',
    [username, password],
    (err, results) => {
      if (err) {
        return res.status(500).json({ error: err.message });
      }

      if (results.length === 0) {
        // If no user found, send an error message with a 400 status
        return res.status(400).json({ error: 'Invalid username or password' });
      }

      // If user found, extract the role and send it in the response
      const user = results[0]; // Assuming the query will return only one row
      return res.status(200).json({
        role: user.Role,
        username: user.Username
      });
    }
  );
});

// View Cases
app.get('/cases', (req, res) => {
  db.query('SELECT * FROM Cases', (err, results) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    res.json(results);
  });
});

// View Criminals
app.get('/criminals', (req, res) => {
  db.query('SELECT * FROM Criminals', (err, results) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    res.json(results);
  });
});

// View Officers
app.get('/officers', (req, res) => {
  db.query('SELECT * FROM Officers', (err, results) => {
    if (err) {
      console.error('Error fetching officers:', err);
      return res.status(500).json({ error: err.message });
    }
    res.json(results);
  });
});

//View Evidences
app.get('/evidence', (req, res) => {
  db.query('SELECT * FROM Evidence', (err, results) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    res.json(results);
  });
});
