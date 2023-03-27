require('dotenv').config()
const express = require('express')
const app = express()
const cors = require('cors')
const {PORT} = process.env

app.use(express.json());
app.use(cors());

//access to controller file
const {} = require("./controller/ctrl");

//static / endpoint for home page
app.use(express.static(`${__dirname}/client`))


app.listen(PORT, () => {
    console.log(`app listening on ${PORT}`)
});