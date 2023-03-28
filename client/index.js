let main = document.querySelector('main')

const baseURL = 'http://localhost:4321';

axios.get('/').then(res => {
    // main.innerHTML = (res.data.link)}).catch(err => console.log(err));
        console.log(res.data)}).catch(err => console.log(err));

