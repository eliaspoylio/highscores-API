const express = require("express")
const mongoose = require("mongoose")
const app = express()
const authRoute = require('./routes/auth')
const scoreRoute = require('./routes/addscore')
const config = require('./config.json');

const dbURL = config.db.authdb

app.use(express.json())
app.use('/api/auth', authRoute)
app.use('/api/score', scoreRoute)


mongoose.connect(dbURL , {useNewUrlParser: true, useUnifiedTopology: true})
const db = mongoose.connection
/*
//default html page
app.get('*', (req, res) => {
    res.send('Default');
});
*/
db.on("error", (err)=>{console.error(err)})
db.once("open", () => {console.log("Connected to DB")})

app.listen(2400, () => {console.log("Server listening to port 2400")})