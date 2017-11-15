$(document).ready(function(){
  $('#result').click(function(){
    $.ajax({
      type: 'POST',
      url: 'ajax_donnees.php',
      success: function(data) {
        $("#resultatsPHP").html(data);
      }
    });
  });
  $('input:text').change(function(){

  });
});
