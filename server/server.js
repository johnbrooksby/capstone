require('dotenv').config()
const express = require('express')
const app = express()
const path = require('path')
const {PORT} = process.env

app.use(express.json());

//access to controller file
const {filterFam, getSpecies, getCommon, getFamily, addNewFam, addNewSpecies, addNewImage, updatedSpeciesList, type} = require("./controller/ctrl");


app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '/../client/index.html'))
})

app.get('/index.html', (req, res) => {
    res.sendFile(path.join(__dirname, '/../client/index.html'))
})

app.get('/typeSearch/:id', type)


app.get('/css', (req, res) => {
    res.sendFile(path.join(__dirname, '/../client/styles.css'))
})

app.get('/js', (req, res) => {
    res.sendFile(path.join(__dirname, '/../client/index.js'))
})

app.get('/ico', (req, res) => {
    res.sendFile(path.join(__dirname, '/../client/favicon.ico'))
})

app.get('/familyNames', filterFam)

app.get('/searchSpecies/:species', getSpecies)
app.get('/speciesList', updatedSpeciesList)
app.get('/searchCommon/:common', getCommon)
app.get('/searchFamily/:id', getFamily)

app.get('/addFamily', filterFam)

app.post('/addFamily', addNewFam)
app.post('/addNewSpecies', addNewSpecies)
app.post('/addImage', addNewImage)

app.listen(PORT, () => {
    console.log(`app listening on ${PORT}`)
});