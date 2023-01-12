// distort_checkbox.js

document.addEventListener('change', function(event) {
  if (event.target.matches('#distort-checkbox')) {
    var distortOptions = document.getElementsByClassName("distort-options");
    if (event.target.checked) {
      for (var i = 0; i < distortOptions.length; i++) {
        distortOptions[i].classList.remove("hidden");
      }
    } else {
      for (var i = 0; i < distortOptions.length; i++) {
        distortOptions[i].classList.add("hidden");
      }
    }
  }
}, false);
