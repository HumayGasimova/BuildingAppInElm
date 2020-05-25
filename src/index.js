require('./index.html');
const {Elm} = require('./Main.elm');

const app = Elm.Main.init({
    node: document.getElementById('app'),
    flags: {
        storedToken: localStorage.getItem('__SIGNIN_TOKEN__')
    }
});

app.ports.sendTokenToStorage.subscribe(token => {
    console.log("token", token)
    localStorage.setItem('__SIGNIN_TOKEN__', token)
})
