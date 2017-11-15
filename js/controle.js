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
  $('#uploadAndImport').submit(function(e){
		e.preventDefault();
		display_loader();
		$.ajax({
			url: "import.php",
			type: "POST",
			data: new FormData(this),
			contentType: false,
			cache: false, 
			processData: false,
			success: function(data) {
				remove_loader(data);
			}
		});
	});
});
function display_loader()
{
	document.getElementById('sub').value = "Import en cours...";
	document.getElementById('sub').setAttribute("disabled", "disabled");
	document.getElementById('loader').innerHTML = '<div style="width:100%;height:0;padding-bottom:100%;position:relative;"><img src="img/loader.gif" width="100%" height="100%" style="position:absolute" frameBorder="0"></img></div>';
}
function remove_loader(data)
{
	document.getElementById('sub').value = "Importer";
	document.getElementById('sub').removeAttribute("disabled");
	document.getElementById('loader').innerHTML = data;
}
