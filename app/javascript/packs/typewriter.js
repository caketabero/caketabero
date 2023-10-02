window.addEventListener('load', () => {
//const text = 'ようこそ@user.さん ';
let textDOM = document.getElementById('typewriter-text');
console.log(textDOM);
let userName = textDOM.getAttribute('data-current-user-name');
//console.log(userName);
const text = 'ようこそ' + userName + 'さん ';
const delay = 75; 
let index = 0;

function type() {
  textDOM.innerHTML += text[index];
  index++;
  if (index >= text.length - 1) {
    clearInterval(intervalId);
  }
}
textDOM.classList.add('typing'); 

const intervalId = setInterval(type, delay);

});