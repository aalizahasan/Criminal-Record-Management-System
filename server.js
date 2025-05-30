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


//1st
app.get('/criminals/:id/cases', (req, res) => {
  const criminalId = req.params.id;
  console.log("Criminal ID received:", criminalId);

  const query = `
    SELECT C.*
    FROM Cases C
    JOIN Criminals CR ON C.Case_Id = CR.Case_Id
    WHERE CR.Criminal_Id = ?
  `;




  db.query(query, [criminalId], (err, results) => {
    if (err) {
      console.error("Database error:", err);
      return res.status(500).json({ error: err.message });
    }
    console.log("Query results:", results);
    res.json(results);
  });
});
app.get('/criminals', (req, res) => {
  const query = `
    SELECT Criminal_Id, C_Name, Gender, Age, Crime_Type, Arrest_Date, C_Status, Case_Id
    FROM Criminals
  `;
  
  connection.query(query, (err, results) => {
    if (err) {
      console.error("Error fetching criminals:", err);
      return res.status(500).json({ error: 'Internal server error' });
    }
    res.json(results);
  });
});


//3rd

// Average hearings per case
app.get('/average-hearings/:caseId', (req, res) => {
  const caseId = req.params.caseId;
  console.log('Received caseId:', caseId);

  const sql = `
    SELECT AVG(Hearing_Count) AS Avg_Hearings_Per_Case
FROM (
    SELECT Case_Id, COUNT(*) AS Hearing_Count
    FROM CourtHearings
    GROUP BY Case_Id 
	) AS HearingCounts;
    SELECT COUNT(*) AS Hearing_Count
FROM CourtHearings
WHERE Case_Id = ?;

  `;

  db.query(sql, [caseId], (err, results) => {
    if (err) {
      console.error('DB Error:', err);
      return res.status(500).json({ error: 'Database error' });
    }
    console.log('Query results:', results);

    if (results.length === 0) {
      return res.status(404).json({ error: 'Case ID not found or no hearings' });
    }
    res.json({
      caseId: results[0].Case_Id,
      hearingCount: results[0].hearingCount
    });
  });
});
const sql = `
  SELECT c.Case_Id, COUNT(ch.Hearing_Id) AS hearingCount
  FROM Cases c
  LEFT JOIN CourtHearings ch ON c.Case_Id = ch.Case_Id
  WHERE c.Case_Id = ?
  GROUP BY c.Case_Id
`;
app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});