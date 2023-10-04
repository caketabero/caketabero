window.addEventListener('load', () => {
  cakeCheckEvent();
});

function cakeCheckEvent() {
  const cakeCheckboxs = document.querySelectorAll('.js__checkbox');

  cakeCheckboxs.forEach((checkbox) => {
    checkbox.addEventListener('click', () => {
      checkbox.parentNode.classList.toggle('checked');
    });
  });
}