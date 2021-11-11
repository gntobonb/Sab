/*First part of function initiates the action when the button is pressed
//Second part of the function initiates the action when the block is pressed as well


//If getting by ID
$("#control-uniqueID1").click(function() {
  //if the control is clicked, we still have to make sure the button is submitted/clicked
  $('#button-uniqueID1').click();
});
//Then if the button is clicked, run the thing
$("#button-uniqueID1").click(function() {
  $('#button-uniqueID1').toggleClass('box-active');
  $('#control-uniqueID1').toggleClass('switch-active');
});

//*
  function oscuro() {
   var element = document.body;
   element.classList.toggle("dark-mode");}
