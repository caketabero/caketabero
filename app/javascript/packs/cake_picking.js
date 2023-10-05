window.addEventListener('load', () => {
  cakeCheckEvent();
});

function cakeCheckEvent() {
  const cakeCheckboxs = document.querySelectorAll('.js__checkbox');
  const cartBox = document.querySelector('#cart-box');
  const buyButton = document.querySelector('#buy-button');
  const clicked_id = [];
  const cart_items = [];
  let total_cost = 0;

  cakeCheckboxs.forEach((checkbox) => {
    checkbox.addEventListener('click', (event) => {
      const cake_item = event.target.parentNode;
      const cake_name = cake_item.querySelector('#cake-name').innerHTML;
      const cake_cost = cake_item.querySelector('#cake-cost').innerHTML.replace( /[^0-9]/g, "");
      const cake_id = cake_item.getAttribute('data-cake-id');

      cake_item.classList.toggle('checked');

      if (clicked_id.indexOf(cake_id) >= 0) {
        // チェック済である場合
        total_cost -= Number(cake_cost);
        for (var i = 0; i < clicked_id.length; i++) {
          if(clicked_id[i] == cake_id){
            clicked_id.splice(i, 1);
            cart_items.splice(i, 1);
          }
        }

      } else if(clicked_id.indexOf(cake_id) == -1) {
        // チェックされていない場合
        total_cost += Number(cake_cost);
        clicked_id.push(cake_id);

        // 段落をつける
        const elmCakeItem = '<p class="post-cake-item">'+
                            cake_name +'¥' + cake_cost +
                            '</p>';

        // 配列のcart_itemsにelmCakeItemを入れる
        cart_items.push(elmCakeItem);

        // if (cart_items.length != 0 ) {
        //   a.split('","');
        // }

        // カンマを<hr>に変換
        var cart_item = cart_items.join("<hr>");

        // console.log(b);
        // cart_items.replace(/,/g, '');
      }
      // console.log(cart_items);

      cartBox.innerHTML = cart_item + '<hr>' + '　合計金額：¥' + total_cost;
    });
  });

  if (location.href.slice(-6) != 'thanks') {
    buyButton.addEventListener('click', (event) => {
      buy();
    });
  }

  function buy() {
    const data = JSON.stringify({
      "cakes_id": clicked_id
    });

    $.ajax({
      method: "POST",
      url: location.origin + "/cakes/stock_adjustment",
      data: data,
      contentType: "application/json"
    }).done(function (data, textStatus, jqXHR) {
      location.href = location.origin + "/cake/thanks"
    });
  }
}