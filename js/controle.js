var dataJson;

$(document).ready(function(){
  $('#result').click(function(){
	 
	 $.ajax({
	   type: "POST",
	   url: "ajax_donnees.php",
	   dataType : 'json',
	   success: function(response){
			$("#resultatsPHP").html("Json obtenu : " + response.dataJson + "<br><br>" 
			+ "Norme min : " + response.normeMin + "<br><br>" + "Norme max : " + response.normeMax
			+ "<br><br>" + "Nombres de rows : " + response.nbRows);
			var tableau = JSON.parse(response.dataJson);
			dataJson = tableau;
			console.log(dataJson);
	   }
	});
	 
  });
  $('input:text').change(function(){

  });
});
