if (location.href.slice( -5 ) == "cakes"){
  window.addEventListener('load', () => {
    const textDOM = document.getElementById('cart-text');
    const userName = textDOM.getAttribute('data-current-user-name');
    const text = 'カートに' + userName + '個のアイテムが入っています ';
    const delay = 0; 
    let index = 0;
    const type= () => {
      textDOM.innerHTML += text[index];
      index++;
      if (index >= text.length) {
        clearInterval(intervalId);
      }
    }
    const cart = document.querySelectorAll(".cart__action");
      cart[0].addEventListener('click',() => {
      cart[0].classList.toggle("active");
      for (let i = 1; i < cart.length; i++) {
        cart[i].classList.toggle("visible");
        }
      });
    
    // $(".cart").click(function(){
    //   $(this).toggleClass('active');
    //     $("#cart-text").toggleClass('panelactive');
    // });
    
    // $("#cart-text a").click(function(){
    //   $(".cart").removeClass('active');
    //   $("#cart-text").removeClass('panelactive');
    // })
    
    const intervalId = setInterval(type, delay);
  });
}

