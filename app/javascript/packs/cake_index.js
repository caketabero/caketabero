if (location.href.slice( -5 ) == "cakes"){
  window.addEventListener('load', () => {
    const cakeCheckboxs = document.querySelectorAll('.js__checkbox');
    cakeCheckboxs.forEach((checkbox) => {
      checkbox.addEventListener('change', (event) => {
        const textDOM = document.querySelector('cart-text');
        const js__checkbox = textDOM.getAttribute('input[type="checkbox"]:checked');
        const text = 'カートに' + js__checkbox + '個のアイテムが入っています ';

    const cart = document.querySelectorAll(".cart__action");
    cart[0].addEventListener('click',() => {
    cart[0].classList.toggle("active");
    for (let i = 1; i < cart.length; i++) {
      cart[i].classList.toggle("visible");
      }
    });
  });
}

