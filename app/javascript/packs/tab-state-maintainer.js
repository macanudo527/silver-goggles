var radioValues = JSON.parse(localStorage.getItem('radioValues')) || {},
    $radios = $("#entries-container :radio");

$radios.on("change", function(){
  $radios.each(function(){
    radioValues[this.id] = this.checked;
  });
  localStorage.setItem("radioValues", JSON.stringify(radioValues));
});

window.onload = $.each(radioValues, function(key, value) {
  $("#" + key).prop('checked', value);
});



