// ケーキページ一覧判定
if (location.href.slice( -5 ) == "cakes") {
  window.addEventListener('load', () => {
    // 全てのチェックボックスを取得
    const cakeCheckboxs = document.querySelectorAll('.js__checkbox');
    // 表示する要素
    const textDOM = document.querySelector('#cart-text');

    // 全てのチェックボックスを1つずつ取り出してループ処理
    cakeCheckboxs.forEach((checkbox) => {
      // それぞれチェックボックスにイベント付与
      checkbox.addEventListener('change', (event) => {
        
        // チェックされたチェックボックスをすべて取得
        const checked_boxs = document.querySelectorAll('input[type="checkbox"]:checked');

        // カートテキストを更新
        textDOM.innerHTML = 'カートに' + checked_boxs.length + '個のアイテムが入っています';
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

//     const text = 'カートに' + js__checkbox + '個のアイテムが入っています ';
//     const delay = 0;
//     let index = 0;
//     const type= () => {
//       textDOM.innerHTML += text[index];
//       index++;
//       if (index >= text.length) {
//         clearInterval(intervalId);
//       }
//     }

//     const intervalId = setInterval(type, delay);


//     cakeCheckboxs.forEach((checkbox) => {
//     checkbox.addEventListener('change', (event) => {
//     const Checkboxs = document.querySelectorAll('input[type="checkbox"]:checked');
//     const a = document.getElementsByClassName("js__checkbox");
//     const getCheckedCount = () => {

//             let count = 0;

//             for (let i = 0; i < a.length; i++) {
//                 if (a[i].checked) {
//                     count++;
//                 }
//             }
//             alert(count);
//             js__checkbox.addEventListener("click", getCheckedCount, false);
//         };
//       });
//     });
//   });
// });