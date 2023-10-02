window.addEventListener('load', () => {
  const textDOM = document.getElementById('cart-text');
  const userName = textDOM.getAttribute('data-current-user-name');
  const text = 'カートに' + userName + '個のアイテムが入っています ';
  const delay = 0; 
  let index = 0;
  const type= () => {
    textDOM.innerHTML += text[index];
    index++;
    if (index >= text.length - 1) {
      clearInterval(intervalId);
    }
  }
  const intervalId = setInterval(type, delay);
});