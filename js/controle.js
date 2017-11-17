$(document).ready(function(){
    $('#result').click(function(e){
		document.getElementById('result').value = "Filtre en cours...";
		document.getElementById('result').setAttribute("disabled", "disabled");
		display_loader('loader_filter');
		update1();
  });
  $('#uploadAndImport').submit(function(e){
		e.preventDefault();
		document.getElementById('result').value = "Import en cours...";
		document.getElementById('result').setAttribute("disabled", "disabled");
		display_loader('loader_import');
		$.ajax({
			url: "import.php",
			type: "POST",
			data: new FormData(this),
			contentType: false,
			cache: false, 
			processData: false,
			success: function(data) {
				document.getElementById('sub').value = "Importer";
				document.getElementById('sub').removeAttribute("disabled");
				remove_loader('loader_import');
			}
		});
	});
});
function display_loader(place)
{
	document.getElementById(place).innerHTML = '<div style="width:100%;height:0;padding-bottom:100%;position:relative;"><img src="img/loader.gif" width="50%" height="50%" style="position:absolute" frameBorder="0"></img></div>';
}
function remove_loader(place)
{
	document.getElementById(place).innerHTML = "";
}
function update1(){
	
		var type = document.getElementById("analyse_type").selectedIndex == 0 ? null : document.getElementById("analyse_type").value;
		var age_min = $("#slider-range" ).slider( "values", 0);
		var age_max = $("#slider-range" ).slider( "values", 1);
		var ville = document.getElementById("ville").innerHTML;
		var sexe = document.getElementById("h").checked ? 1 : (document.getElementById("f").checked ? 2 : null);
		
		$.ajax({
		  type: 'POST',
		  url: 'ajax_donnees.php',
		  data: {
			  ville:ville,
			  type:type,
			  age_min:age_min,
			  age_max:age_max,
			  sexe:sexe
		  } ,
		  dataType : 'json',
		  success: function(response){
				  console.log(response);
					$("#resultatsPHP").html("Norme min calculée: " + response.normeMin_calc + "&nbspNorme min : " + response.normeMin + "<br>" + "Norme max calculée: " + response.normeMax_calc + "&nbspNorme max : " + response.normeMax
					+ "<br>" + "Nombre d'analyses : " + response.nbRows);
					var dataJson = JSON.parse(response.dataJson);
					console.log(dataJson);
					var chart = new CanvasJS.Chart("chartContainer", {
					animationEnabled: true,
					theme: "light2",
					title:{
						text: "Répartition des résultats d'analyse"
					},
					axisY:{
						includeZero: false
					},
					data: [{        
						type: "line",       
						dataPoints: dataJson
					}]
				});
				chart.render();
				draw_d3_chart();
				document.getElementById('result').value = "Importer";
				document.getElementById('result').removeAttribute("disabled");
				remove_loader('loader_filter');
		  }
		});
	}
	
	function search(){
		var type = document.getElementById("analyse_type").selectedIndex == 0 ? null : document.getElementById("analyse_type").value;
		var age_min = $("#slider-range" ).slider( "values", 0);
		var age_max = $("#slider-range" ).slider( "values", 1);
		var ville = document.getElementById("ville").innerHTML;
		var sexe = document.getElementById("h").checked ? 1 : (document.getElementById("f").checked ? 2 : null);
		
		$.ajax({
		  type: 'POST',
		  url: 'ajax_donnees.php',
		  data :{
			  ville:ville,
			  type:type,
			  age_min:age_min,
			  age_max:age_max,
			  sexe:sexe,
			  update_select:"ok"
		  },
		  success: function(){
				search_carte();
		  }
		});
	}

