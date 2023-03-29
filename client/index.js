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
    let add1 = document.createElement('option')
    add1.textContent = "---------------";
    familyDropDown.appendChild(add1)
    
    dataObj.forEach(item => {
        let value = document.createElement('option');
    
        const { family, id } = item
        
        value.textContent =  family
        
        value.setAttribute("id", (id))
        familyDropDown.appendChild(value)
        
    })
    let add2 = document.createElement('option')
    add2.textContent = "Add a Family";
    add2.setAttribute("id", 0)
    familyDropDown.appendChild(add2)
}

function searchPlant(event) {
    event.preventDefault();
    let speciesArr = species.value.split(' ')
    speciesJoin = speciesArr.join('%20')
    // console.log(speciesJoin)
    if (speciesJoin !== ""){
        axios.get('/search/' + speciesJoin).then(res => {
            console.log(res.data)
            displayPic()
        }).catch(err => console.log(err))
    }
}

function displayPic (dataObj){

}

function addCard(dataObj){

}

getData()

search.addEventListener('submit', searchPlant)