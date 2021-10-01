$(document).ready(function() {
  $('label[for=choice-1]').click(function() {
    $('body').addClass('choice-1').removeClass('choice-2 choice-3');
  });
    
  $('label[for=choice-2]').click(function() {
    $('body').addClass('choice-2').removeClass('choice-1 choice-3');
  });
  
  $('label[for=choice-3]').click(function() {
    $('body').addClass('choice-3').removeClass('choice-1 choice-2');
  });
});