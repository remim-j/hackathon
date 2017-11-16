$(document).ready(function(){
    $('#result').click(function(e){
	e.preventDefault();
	var type = document.getElementById("analyse_type").selectedIndex == 0 ? null : document.getElementById("analyse_type").value;
	var age_min = $("#slider-range" ).slider( "values", 0);
	var age_max = $("#slider-range" ).slider( "values", 1);
	if(age_min !== "" && age_max !== "" && parseFloat(age_max) <= parseFloat(age_min))
	{
		document.getElementById("test_age").innerHTML = "Erreur age";
		return;
	}
	var sexe = document.getElementById("h").checked ? 1 : (document.getElementById("f").checked ? 2 : null);
	$.ajax({
      type: 'POST',
      url: 'ajax_donnees.php',
	  data:{
		  type:type,
		  age_min:age_min,
		  age_max:age_max,
		  sexe:sexe,
		  group:"ok"
	  },
	  //dataType : 'json',
	  success: function(response){
			console.log(response);
			search();
		}
    });
	
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
function getLineChart()
{
	var type = document.getElementById("analyse_type").selectedIndex == 0 ? null : document.getElementById("analyse_type").value;
	var age_min = $("#slider-range" ).slider( "values", 0);
	var age_max = $("#slider-range" ).slider( "values", 1);
	var ville = document.getElementById("ville").innerHTML;
	var sexe = document.getElementById("h").checked ? 1 : (document.getElementById("f").checked ? 2 : null);
	$.ajax({
      type: 'POST',
      url: 'ajax_donnees.php',
	  data:{
		  ville:ville,
		  type:type,
		  age_min:age_min,
		  age_max:age_max,
		  sexe:sexe
	  },
	  dataType : 'json',
	  success: function(response){
		  console.log(response);
			$("#resultatsPHP").html("Norme min : " + response.normeMin + "<br>" + "Norme max : " + response.normeMax
			+ "<br>" + "Nombre d'analyses : " + response.nbRows);
			var dataJson = JSON.parse(response.dataJson);
			console.log(dataJson);
			var chart = new CanvasJS.Chart("chartContainer", {
			animationEnabled: true,
			theme: "light2",
			title:{
				text: "Simple Line Chart"
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
		}
    });
}

