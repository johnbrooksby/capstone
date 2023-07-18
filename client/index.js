let main = document.querySelector('main')
let familyDropDown = document.getElementById('drop-down')
let common = document.getElementById('common')
let species = document.getElementById('species')
let search = document.getElementById('search')
let searchRes = document.getElementById('searchRes')
let addPlant = document.getElementById('add');
let speciesAdd = document.getElementById('speciesAdd');
let commonAdd = document.getElementById('commonAdd');
let type = document.getElementById('decid');
let imageAdd = document.getElementById('imageAdd');
let familyAdd = document.getElementById('familyAdd');
let newFam = document.getElementById('newFam');
let evergreens = document.getElementById('Evergreen');
let houseplants = document.getElementById('Houseplant');
let deciduous = document.getElementById('Deciduous');
let flowers = document.getElementById('Flower');
let evergreen2 = document.getElementById('Evergreen2')
let houseplant2 = document.getElementById('Houseplant2');
let deciduous2 = document.getElementById('Deciduous2');
let flower2 = document.getElementById('Flower2');

let familyArr = []
let evergreensArr = []

window.onbeforeunload = function () {
    window.scrollTo(0, 0);
  }

const baseURL = 'http://localhost:4321';

axios.get('/').then(res => {
    }).catch(err => console.log(err));

function getData(){
    axios.get('/familyNames').then(res => {
        familyArr = res.data
        addToView(res.data)
    }).catch(err => console.log(err))
}

function getEvergreens(){
    axios.get('/evergreens/').then(res => {
        evergreensArr = res.data
        addToView(res.data)
    }).catch(err => console.log(err))
}

function addToView(dataObj) {
    familyDropDown.textContent = '';
    familyAdd.textContent = '';
    let add = document.createElement('option')
    add.textContent = "---------------";
    familyDropDown.appendChild(add)
    let add2 = document.createElement('option')
    add2.textContent = "---------------";
    familyAdd.appendChild(add2)
    
    dataObj.forEach(item => {
        let value = document.createElement('option');
        let value2 = document.createElement('option');
        const { family, id } = item
        
        value.textContent =  family
        value2.textContent = family
        
        value.setAttribute("id", (id))
        value2.setAttribute("id", (id))
        familyDropDown.appendChild(value)
        familyAdd.appendChild(value2)

        
    })
    let add3 = document.createElement('option')
    add3.textContent = "Add a Family";
    add3.setAttribute("id", 0)
    familyAdd.appendChild(add3)
    document.documentElement.scrollTop = 0;
}

function searchPlant(event) {
    event.preventDefault();
    
    if (species.value !== ""){

        // Standardize capitalization of scientific name search input
        let firstLetter = species.value[0].toUpperCase()
        let remaining = species.value.slice(1, species.value.length)
        species.value = firstLetter + remaining.toLowerCase()

        // Format for sending as search parameter
        let speciesArr = species.value.split(' ')
        let speciesJoin = speciesArr.join('%20')
        axios.get('/searchSpecies/' + speciesJoin).then(res => {
            species.value = ''
            displayPic(res.data)
        }).catch(err => console.log(err))
    } else if(common.value !== ""){

        // Standardize capitalization of common name search input
        let split = common.value.split(' ')
        let titleArr = split.map(word => {
            let firstLetter = word.charAt(0).toUpperCase()
            let remaining = word.slice(1, word.length)
            word = firstLetter + remaining.toLowerCase()
            return word
        })
        let commonJoin = titleArr.join('%20')
        
        axios.get('/searchCommon/' + commonJoin).then(res => {
            common.value = ""
            displayPic(res.data)
        }).catch(err => console.log(err))
    } else if(familyDropDown.value !== "---------------"){
        let id = familyDropDown.value
        axios.get('/searchFamily/' + id).then(res => {
            familyDropDown.value = "---------------";
            displayPic(res.data);
        }).catch(err => console.log(err));
    } else {
        alert("Please enter search criteria")
    }
}

function displayPic (dataArr){
    searchRes.innerHTML = '';
    searchRes.classList.add('results')
    dataArr.forEach(element => {
        searchRes.innerHTML += `
        <section class='searchBox'>
        <img class='navimg searchimg' alt='${element.name} pic' src='${element.picture}'/>
        <h3>${element.name}<br>
        ${element.common_name}</h3>
        </section>`
    })
    document.documentElement.scrollTop = 0;
}

function addPlant2DB(event){
    event.preventDefault()

    let newFamId = 0
   
    if (familyAdd.value === "Add a Family" || familyAdd.value === "---------------") {

        // Check the family array to see if the input name to add already exists
        for (let i = 0; i < familyArr.length; i++){
            if (newFam.value === familyArr[i].family) {
                newFamId = familyArr[i].id
            }
        }
        if (newFamId === 0){
            addAFamily()
        } else {
            addSpecies()
        }
    } else {
        addSpecies()
    }
}

function addAFamily(){
    let firstLetter = newFam.value[0].toUpperCase()
    let remaining = newFam.value.slice(1, newFam.value.length)
    newFam.value = firstLetter + remaining.toLowerCase()
        let newFamBody = {
            family: newFam.value
        }
        axios.post('/addFamily/', newFamBody).then(res => {
        }).catch(err => console.log(err))
    addSpecies()
}


function addSpecies(){
    let famId = 0
    setTimeout(() => {
        
        axios.get('/familyNames/').then(res => {
            familyArr = res.data

            // Make species capitalize only first letter of the Genus and all others lower case
            let firstLetter = speciesAdd.value[0].toUpperCase()
            let remaining = speciesAdd.value.slice(1, speciesAdd.value.length)
            speciesAdd.value = firstLetter + remaining.toLowerCase()

            // Make first letter of each word of the common name capitalized and all others lower case
            let split = commonAdd.value.split(' ')
            let titleArr = split.map(word => {
                let firstLetter = word.charAt(0).toUpperCase()
                let remaining = word.slice(1, word.length)
                word = firstLetter + remaining.toLowerCase()
                return word
            })
            let commonAddInput = titleArr.join(' ')
            
            //Once I get updated familyArr, find the id of the input family
            for (let i = 0; i < familyArr.length; i++){
                if (familyAdd.value === familyArr[i].family || newFam.value === familyArr[i].family) {
                    famId = familyArr[i].id
                }
            }
            
            let bodyObj = {
                name: speciesAdd.value,
                common_name: commonAddInput,
                plant_type_id: type.value,
                family_id: famId
            };
            
            //Now create the new table line, using the family_id, or new family_id as applicable
            axios.post('/addNewSpecies/', bodyObj).then(res => {
            }).catch(err => console.log(err))
            
        }).catch(err => console.log(err))
        addALink()}, 750);
}

function addALink(){
    setTimeout(() => {
        let speciesId = 0
        let plantListArr = []
        axios.get('/speciesList/').then(res => {
            plantListArr = res.data
            for (let i = 0; i < plantListArr.length; i++){
                if (speciesAdd.value === plantListArr[i].name) {
                    speciesId = plantListArr[i].id
                }
            }
            
            let newLinkBody = {
                link: imageAdd.value,
                plant_list_id: +speciesId
            }

            axios.post('/addImage/', newLinkBody).then(res => {
            }).catch(err => console.log(err))

            let speciesArr = speciesAdd.value.split(' ')
            let speciesJoin = speciesArr.join('%20')
            axios.get('/searchSpecies/' + speciesJoin).then(res => {
                searchRes.innerHTML = '';
                speciesAdd.value = ''
                commonAdd.value = ''
                imageAdd.value = ''
                familyAdd.value = "---------------"
                newFam.value = ''
                displayPic(res.data)
            }).catch(err => console.log(err))
        }).catch(err => console.log(err))}, 1000);
    
        getData()
}

function searchByType (event){
    let id = event.target.getAttribute('id')
    if (id === "Deciduous2") {
        id = "Deciduous"
    } else if (id === "Evergreen2"){
        id = "Evergreen"
    } else if (id === "Flower2"){
        id = "Flower"
    } else if (id === "Houseplant2"){
        id = "Houseplant"
    }
    axios.get('/typeSearch/' + id).then(res => {
        displayPic(res.data)
    }).catch(err => console.log(err))
}

getData()

search.addEventListener('submit', searchPlant)
addPlant.addEventListener('submit', addPlant2DB)
evergreens.addEventListener('click', searchByType)
deciduous.addEventListener('click', searchByType)
flowers.addEventListener('click', searchByType)
houseplants.addEventListener('click', searchByType)
evergreen2.addEventListener('click', searchByType)
deciduous2.addEventListener('click', searchByType)
flower2.addEventListener('click', searchByType)
houseplant2.addEventListener('click', searchByType)
