require('dotenv').config()
const express = require('express')
const app = express()
const path = require('path')
const {PORT} = process.env

app.use(express.json());

//access to controller file
const {filterFam, filterFam2, getSpecies, getCommon, getFamily, addNewFam, addNewSpecies, addNewImage, getSpecies2, updatedSpeciesList, type} = require("./controller/ctrl");

//static / endpoint for home page
// app.use(express.static(`${__dirname}/client`))

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '/../client/index.html'))
})

app.get('/index.html', (req, res) => {
    res.sendFile(path.join(__dirname, '/../client/index.html'))
})

// app.get('/houseplants.html', (req, res) => {
//     res.sendFile(path.join(__dirname, '/../client/houseplants.html'))
// })

// app.get('/evergreens.html', (req, res) => {
//     res.sendFile(path.join(__dirname, '/../client/evergreens.html'))
// })

// app.get('/deciduous.html', (req, res) => {
//     res.sendFile(path.join(__dirname, '/../client/deciduous.html'))
// })

// app.get('/flowers.html', (req, res) => {
//     res.sendFile(path.join(__dirname, '/../client/flowers.html'))
// })
//---------------------------------
app.get('/typeSearch/:id', type)


app.get('/css', (req, res) => {
    res.sendFile(path.join(__dirname, '/../client/styles.css'))
})

app.get('/js', (req, res) => {
    res.sendFile(path.join(__dirname, '/../client/index.js'))
})

app.get('/familyNames', filterFam)
app.get('/familyNames2', filterFam2)

app.get('/searchSpecies/:species', getSpecies)
app.get('/returnSpecies/:species', getSpecies2)
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