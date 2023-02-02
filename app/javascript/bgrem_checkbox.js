// bgrem_checkbox.js

document.addEventListener('change', function(event) {
  if (event.target.matches('#bgrem-checkbox')) {
    var bgremOptions = document.getElementsByClassName("bgrem-options");
    if (event.target.checked) {
      for (var i = 0; i < bgremOptions.length; i++) {
        bgremOptions[i].style.display = "none";
      }
    } else {
      for (var i = 0; i < bgremOptions.length; i++) {
        bgremOptions[i].style.display = "block";
      }
    }
  }
}, false);
