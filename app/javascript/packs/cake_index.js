if (location.href.slice( -5 ) == "cakes"){
  window.addEventListener('load', () => {
    const cakeCheckboxs = document.querySelectorAll('.js__checkbox');
    cakeCheckboxs.forEach((checkbox) => {
      checkbox.addEventListener('change', (event) => {
        const textDOM = document.getElementById('cart-text');
        const js__checkbox = textDOM.getAttribute('input[type="checkbox"]:checked');
        const text = 'カートに' + js__checkbox + '個のアイテムが入っています ';
        const delay = 0;
        let index = 0;
        const type= () => {
          textDOM.innerHTML += text[index];
          index++;
          if (index >= text.length) {
            clearInterval(intervalId);
          }
        }
  
        const intervalId = setInterval(type, delay);
        
        
        cakeCheckboxs.forEach((checkbox) => {
        checkbox.addEventListener('change', (event) => {
        const Checkboxs = document.querySelectorAll('input[type="checkbox"]:checked');
        const a = document.getElementsByClassName("js__checkbox");
        const getCheckedCount = () => {
            
                let count = 0;
            
                for (let i = 0; i < a.length; i++) {
                    if (a[i].checked) {
                        count++;
                    }
                }
                alert(count);
                js__checkbox.addEventListener("click", getCheckedCount, false);
            };
          });
        });
      });
    });
      
   
    
    const cart = document.querySelectorAll(".cart__action");
    cart[0].addEventListener('click',() => {
    cart[0].classList.toggle("active");
    for (let i = 1; i < cart.length; i++) {
      cart[i].classList.toggle("visible");
      }
    });
  });
}

