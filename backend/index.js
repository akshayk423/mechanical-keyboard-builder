import express from "express";
import mysql from "mysql";
import cors from "cors";

const app = express();
app.use(cors());
app.use(express.json());

// connect to database
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "password",
  database: "mkdb",
});

// get info thing
app.get("/", (req, res) => {
    const q = "SELECT * FROM Users WHERE username = 'bluu';";       // query

    db.query(q, (err, data) => {
        if (err) return res.send(err);      // return error
        
        // return json
        return res.json(data);
    })
});

// check if valid sign in
app.put("/signIn", (req, res) => {
    const q = "SELECT * FROM Users WHERE username=? AND password=?;";
    const values = [
      req.body.username,
      req.body.password
    ]
    
    db.query(q, values, (err, data) => {
        if (err) return res.send(err);
        return res.json(data);
    })
})

/*
app.post("/signUp", (req, res) => {
    const q = ""
})
*/

app.listen(8800, () => {
    console.log("Connected to backend.");
});

