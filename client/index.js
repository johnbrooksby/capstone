let main = document.querySelector('main')
let familyDropDown = document.getElementById('drop-down')
let common = document.getElementById('common')
let species = document.getElementById('species')
let search = document.getElementById('search')
let searchRes = document.getElementById('searchRes')

const baseURL = 'http://localhost:4321';

axios.get('/').then(res => {
    console.log(res.data)}).catch(err => console.log(err));

function getData(){
    axios.get('/familyNames').then(res => {
        addToView(res.data)
    }).catch(err => console.log(err))
}

function addToView(dataObj) {
    familyDropDown.textContent = '';
    let add = document.createElement('option')
    add.textContent = "---------------";
    familyDropDown.appendChild(add)
    
    dataObj.forEach(item => {
        let value = document.createElement('option');
    
        const { family, id } = item
        
        value.textContent =  family
        
        value.setAttribute("id", (id))
        familyDropDown.appendChild(value)
        
    })
    // let add2 = document.createElement('option')
    // add2.textContent = "Add a Family";
    // add2.setAttribute("id", 0)
    // familyDropDown.appendChild(add2)
}

function searchPlant(event) {
    event.preventDefault();
    // console.log(speciesJoin)
    if (species.value !== ""){
        let speciesArr = species.value.split(' ')
        speciesJoin = speciesArr.join('%20')
        axios.get('/searchSpecies/' + speciesJoin).then(res => {
            console.log(res.data)
            displayPic()
        }).catch(err => console.log(err))
    } else if(common.value !== ""){
        let commonArr = common.value.split(' ')
        commonJoin = commonArr.join('%20')
        axios.get('/searchCommon/' + commonJoin).then(res => {
            console.log(res.data)
            displayPic()
        }).catch(err => console.log(err))
    } else if(familyDropDown.value.id !== "---------------"){
        let id = familyDropDown.value
        console.log(familyDropDown.value)
        axios.get('/searchFamily/' + id).then(res => {
            console.log(res.data)
            displayPic()
        }).catch(err => console.log(err))
    } else {
        alert("Please enter search criteria")
    }
}

function displayPic (dataObj){

}

function addCard(dataObj){

}

getData()

search.addEventListener('submit', searchPlant)