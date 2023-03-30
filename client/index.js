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
let famInput = newFam.value

const baseURL = 'http://localhost:4321';

axios.get('/').then(res => {
    console.log('')}).catch(err => console.log(err));

function getData(){
    axios.get('/familyNames').then(res => {
        familyArr = res.data
        // console.log(familyArr)
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
        speciesJoin = speciesArr.join('%20')
        axios.get('/searchSpecies/' + speciesJoin).then(res => {
            // console.log(res.data)
            searchRes.innerHTML = '';
            species.value = ''
            displayPic(res.data)
        }).catch(err => console.log(err))
    } else if(common.value !== ""){
        let commonArr = common.value.split(' ')
        commonJoin = commonArr.join('%20')
        axios.get('/searchCommon/' + commonJoin).then(res => {
            // console.log(res.data)
            searchRes.innerHTML = '';
            common.value = ""
            displayPic(res.data)
        }).catch(err => console.log(err))
    } else if(familyDropDown.value !== "---------------"){
        let id = familyDropDown.value
        console.log(familyDropDown.value)
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

    // console.log(familyAdd.value)
    if (familyAdd.value === "Add a Family") {

        // Check the family array to see if the input name to add already exists2
        for (let i = 0; i < familyArr.length; i++){
            if (famInput === familyArr[i].family) {
                newFamId = familyArr[i].id
                
            }
            console.log(famInput)
            // console.log('------')
            // console.log(familyArr[i].id)
            // console.log('------')
            // console.log(newFamId)
            // console.log('------')
            // console.log('------')
        }
        if (newFamId = 0){
            addAFamily()
        }

        
    }

    //refresh familyArr
    // getData()
        //Once I get updated familyArr, find the id of the input family
        for (let i = 0; i < familyArr.length; i++){
            if (famInput === familyArr[i].family) {
                newFamId = familyArr[i].id
            }
        }
        // console.log(newFamId)

        let maBod = {
            name: speciesAdd.value,
            common_name: commonAdd.value,
            plant_type_id: type.value,
            link: imageAdd.value,
            family: newFamId
        };
        // console.log(body)
        
        //Now create the new table line, using the family_id, or new family_id as applicable
        axios.post('/addNewSpecies', maBod).then(res => {
            console.log(res.data)
        }).catch(err => console.log(err))
        // console.log('---------')
        // console.log(body)
        
        
        // console.log(familyAdd)
        
        //Add the new family to the Families table
        
        //Get current family table data to determine the ID of the added family
        // axios.get('/addFamily/').then(res => {
            
            
            //     speciesAdd.value = ""
            //     commonAdd.value = ""
            //     imageAdd.value = ""
            //     familyAdd.value = "---------------"
            //     newFam.value = ""
            // }).catch(err => console.log(err));
}
            
            
function addAFamily(){

    console.log('---')
    console.log(famInput)
    console.log('---')
        let newFamBody = {
            family: famInput
        }
        axios.post('addFamily/', newFamBody).then(res => {
            console.log(res.data)
        }).catch(err => console.log(err))
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

