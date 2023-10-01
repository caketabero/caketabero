
  window.addEventListener("load",() =>{
    const accordion = document.querySelectorAll(".accordion__item");
      accordion[0].addEventListener('click', function() {
      accordion[0].classList.toggle("active");
      for (let i = 1; i < 5; i++) {
        accordion[i].classList.toggle("visible");
      }
    });
  });
