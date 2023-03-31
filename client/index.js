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

let familyArr = []

const baseURL = 'http://localhost:4321';

axios.get('/').then(res => {
    console.log('Hello world!')}).catch(err => console.log(err));

function getData(){
    axios.get('/familyNames').then(res => {
        familyArr = res.data
        // console.log(familyArr)
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
    familyDropDown.appendChild(add2)
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
}

function searchPlant(event) {
    event.preventDefault();
    
    if (species.value !== ""){
        // formatTitleOne(species)
        // console.log(species)
        let speciesArr = species.value.split(' ')
        let speciesJoin = speciesArr.join('%20')
        axios.get('/searchSpecies/' + speciesJoin).then(res => {
            // console.log(res.data)
            searchRes.innerHTML = '';
            species.value = ''
            displayPic(res.data)
        }).catch(err => console.log(err))
    } else if(common.value !== ""){
        let commonArr = common.value.split(' ')
        let commonJoin = commonArr.join('%20')
        axios.get('/searchCommon/' + commonJoin).then(res => {
            // console.log(res.data)
            searchRes.innerHTML = '';
            common.value = ""
            displayPic(res.data)
        }).catch(err => console.log(err))
    } else if(familyDropDown.value !== "---------------"){
        let id = familyDropDown.value
        // console.log(familyDropDown.value)
        axios.get('/searchFamily/' + id).then(res => {
            // console.log(res.data)
            searchRes.innerHTML = '';
            familyDropDown.value = "---------------";
            displayPic(res.data);
        }).catch(err => console.log(err));
    } else {
        alert("Please enter search criteria")
    }
}

function displayPic (dataArr){
    // console.log(dataArr)
    dataArr.forEach(element => {
        
        searchRes.innerHTML += `
            <section class='searchBox'>
            <img class='navimg searchimg' alt='${element.name} pic' src='${element.picture}'/>
                <h3>${element.name}</h3>
            </section>`
    })
}

function addPlant2DB(event){
    event.preventDefault()

    let newFamId = 0
    // console.log('-----')
    // console.log(newFam.value)
    // console.log('-----')
    // console.log(familyAdd.value)
    // console.log('-----')

    // console.log(familyAdd.value)
    if (familyAdd.value === "Add a Family" || familyAdd.value === "---------------") {

        // Check the family array to see if the input name to add already exists
        for (let i = 0; i < familyArr.length; i++){
            if (newFam.value === familyArr[i].family) {
                newFamId = familyArr[i].id
                
            }
        }
        // console.log(newFamId)
        if (newFamId === 0){
            addAFamily()
        }
    } else {
        for (let i = 0; i < familyArr.length; i++){
            if (newFam.value === familyArr[i].family) {
                newFamId = familyArr[i].id
                
            }
        }
        addSpecies()
    }
}

function addAFamily(){

        let newFamBody = {
            family: newFam.value
        }
        axios.post('/addFamily/', newFamBody).then(res => {
            // console.log(res.data)
        }).catch(err => console.log(err))
    addSpecies()
}


function addSpecies(){
    let famId = 0
    setTimeout(() => {
        
        axios.get('/familyNames2/').then(res => {
            familyArr = res.data
            
            //Once I get updated familyArr, find the id of the input family
            for (let i = 0; i < familyArr.length; i++){
                if (newFam.value === familyArr[i].family) {
                    famId = familyArr[i].id
                    // console.log(familyArr[i].id)
                }
            }
            // console.log('addSpecies now')
            // console.log(famId)
            
            let maBod = {
                name: speciesAdd.value,
                common_name: commonAdd.value,
                plant_type_id: type.value,
                family_id: famId
            };
            console.log(maBod)
            
            //Now create the new table line, using the family_id, or new family_id as applicable
            axios.post('/addNewSpecies/', maBod).then(res => {
                console.log('addNewSpecies res.data:')
                console.log(res.data)
            }).catch(err => console.log(err))
            
        }).catch(err => console.log(err))
        addALink()}, 500);
}

function addALink(){
    setTimeout(() => {
        let speciesId = 0
        let plantListArr = []
        axios.get('/speciesList/').then(res => {
            plantListArr = res.data
            // console.log('plantListArr')
            // console.log(plantListArr)
            for (let i = 0; i < plantListArr.length; i++){
                if (speciesAdd.value === plantListArr[i].name) {
                    speciesId = plantListArr[i].id
                }
            }
            // console.log('speciesId')
            // console.log(speciesId)
            
            let newLinkBody = {
                link: imageAdd.value,
                plant_list_id: +speciesId
            }

            axios.post('/addImage/', newLinkBody).then(res => {
                // console.log(res.data)
            }).catch(err => console.log(err))

            let speciesArr = speciesAdd.value.split(' ')
            let speciesJoin = speciesArr.join('%20')
            axios.get('/returnSpecies/' + speciesJoin).then(res => {
                // console.log(res.data)
                searchRes.innerHTML = '';
                speciesAdd.value = ''
                commonAdd.value = ''
                familyAdd.value = "---------------"
                newFam.value = ''
                displayPic(res.data)
            }).catch(err => console.log(err))
        }).catch(err => console.log(err))
        console.log('Waiting 3 seconds for DB to update')}, 750);
        getData()
}
        

// function formatTitle(str) {
//     let split = str.split(' ')
//     let titleArr = split.map(word => {
//         let firstLetter = word.charAt(0).toUpperCase()
//         let remaining = word.slice(1, word.length)
//         word = firstLetter + remaining
//         return word
//     })
//     let title = titleArr.join(' ')
//     return title
// }

function formatTitleOne(str) {
    let firstLetter = str[0].toUpperCase()
    let remaining = str.slice(1, str.length)
    str = firstLetter + remaining.toLowerCase()
    return str
}

getData()

search.addEventListener('submit', searchPlant)
addPlant.addEventListener('submit', addPlant2DB)

