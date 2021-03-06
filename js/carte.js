				$( function() {
				$( "#slider-range" ).slider({
					range: true,
					min: 0,
					max: 150,
					values: [ 0, 150 ],
					slide: function(event, ui) {
						$( "#amount" ).val(ui.values[0] + " - " + ui.values[1]);
					}
				});
				$( "#amount" ).val($( "#slider-range" ).slider( "values", 0 ) +
					" - " + $( "#slider-range" ).slider( "values", 1 ) );
			} );
			
			function showHideImport() {
				var x = document.getElementById("importDIV");
				if (x.style.display === "none") {
					x.style.display = "block";
				} else {
					x.style.display = "none";
				}
			}

			var width = 430, height = 550;

			var path = d3.geoPath();

			var projection = d3.geoConicConformal()
				.center([2.72, 46.33])
				.scale(35000) // Lux : 35000 Fra : 2600
				.translate([-1200, 2600]); // Lux : -1200, 2600 ; Fra : 300, 300

			path.projection(projection);

			var svg = d3.select('#map').append("svg")
				.attr("id", "svg")
				.attr("width", width)
				.attr("height", height)
				.attr("viewBox", "0 0 " + width + " " + height)
				.attr("preserveAspectRatio", "xMinYMid")
				.attr("class", "YlOrRd");

			var deps = svg.append("g");

			d3.json("departmentsLux.json", function(req, geojson) {
				var features = deps
					.selectAll("path")
					.data(geojson.features)
					.enter()
					.append("path")
					.attr('id', function(d) {return "d" + d.properties.cartodb_id;})
					.attr("d", path);

				d3.csv("fichier.csv", function(csv) {
					// Quantile scales map an input domain to a discrete range, 0...max(population) to 1...9
					var quantile = d3.scaleQuantile()
						.domain([d3.min(csv, function(e) { return (((Math.abs(e.Norme_max_calc-e.Norme_max)) + (Math.abs(e.Norme_min_calc-e.Norme_min)))/2);
															}), d3.max(csv, function(e) { return (((Math.abs(e.Norme_max_calc-e.Norme_max)) + (Math.abs(e.Norme_min_calc-e.Norme_min)))/2);
															})])
						.range(d3.range(9));

					var legend = svg.append('g')
						.attr('transform', 'translate(375, 150)')
						.attr('id', 'legend');

					legend.selectAll('.colorbar')
						.data(d3.range(9))
					  .enter().append('svg:rect')
						.attr('y', function(d) { return d * 20 + 'px'; })
						.attr('height', '20px')
						.attr('width', '20px')
						.attr('x', '0px')
						.attr("class", function(d) { return "q" + d + "-9"; });

					var legendScale = d3.scaleLinear()
						.domain([d3.min(csv, function(e) { return (((Math.abs(e.Norme_max_calc-e.Norme_max)) + (Math.abs(e.Norme_min_calc-e.Norme_min)))/2);
															}), d3.max(csv, function(e) { return (((Math.abs(e.Norme_max_calc-e.Norme_max)) + (Math.abs(e.Norme_min_calc-e.Norme_min)))/2);
															})])
						.range([0, 9 * 20]);

					var legendAxis = svg.append("g")
						.attr('transform', 'translate(400, 150)')
						.call(d3.axisRight(legendScale).ticks(6));

					csv.forEach(function(e,i) {
						d3.select("#d" + e.Cartodb_id)
							.attr("class", function(d) { return "department q" + quantile(((Math.abs(e.Norme_max_calc-e.Norme_max)) + (Math.abs(e.Norme_min_calc-e.Norme_min)))/2) + "-9"; })
							.on("mouseover", function(d) {
								div.transition()
									.duration(200)
									.style("opacity", .9);
								div.html("<b>Commune : </b>" + e.Communes + "<br>"
										+ "<b>Norme max calc : </b>" + e.Norme_max_calc + " ; " + "<b>Norme max : </b>" + e.Norme_max + "<br>"
										+ "<b>Norme min calc : </b>" + e.Norme_min_calc + " ; " + "<b>Norme min : </b>" + e.Norme_min)
									.style("left", (d3.event.pageX + 30) + "px")
									.style("top", (d3.event.pageY - 30) + "px");
							})
							.on("click", function(d) {
								d3.select("#ville").html(e.Communes);
							})
							.on("mouseout", function(d) {
								div.transition()
									.duration(500)
									.style("opacity", 0);
								div.html("")
									.style("left", "0px")
									.style("top", "0px");
							});
					});
				});
			});

			d3.select("#selection").on("change", function() {
				d3.selectAll("svg").attr("class", this.value);
			});

			var div = d3.select("#map").append("div")
				.attr("class", "tooltip")
				.style("opacity", 0);



			d3.json("data.json", draw); // "data.json"

			function draw(dataset){
				//Largeur et hauteur du graphe
				var larg =500;
				var haut =100;
				var barPadding =2;//Padding des barres
				var nbb = dataset.length;//Nb de barres
				var lb =((larg - nbb) / nbb);//Largeur barre
				var ch =(haut / d3.max(dataset, function(d){
													return d.valeur //Coef. hauteur.
												}));

				//Creation élément SVG
				var svg = d3.select('#resultHBD')
					.append("svg")
					.attr("width", larg)
					.attr("height", haut);

				svg.selectAll("rect")
					.data(dataset)
					.enter()
					.append("rect")
					.attr("x", function(d, i){
						return(i * lb);
					})
				   .attr("y", function(d){
						return haut -(d.valeur * ch);
					})
					.attr("width", lb - barPadding)
					.attr("height", function(d){
						return(d.valeur * ch);
					})
					.attr("fill", function(d){
						return"rgb(0, 0, "+(d.valeur *10)+")";
					});

				svg.selectAll("text")
					.data(dataset)
					.enter()
					.append("text")
					.text(function(d){
					   return d.valeur;
					})
					.attr("x", function(d, i){
						return(i * lb)+ 12;
					})
					.attr("y", function(d){
						return haut -((d.valeur * ch)-12);
					})
					.attr("font-family", "sans-serif")
					.attr("font-size", "11px")
					.attr("fill", "white");
			}
function update() {
	var svg = d3.select('#map');
svg.selectAll("*").remove();

    var width = 430, height = 550;

			var path = d3.geoPath();

			var projection = d3.geoConicConformal()
				.center([2.72, 46.33])
				.scale(35000) // Lux : 35000 Fra : 2600
				.translate([-1200, 2600]); // Lux : -1200, 2600 ; Fra : 300, 300

			path.projection(projection);

			var svg = d3.select('#map').append("svg")
				.attr("id", "svg")
				.attr("width", width)
				.attr("height", height)
				.attr("viewBox", "0 0 " + width + " " + height)
				.attr("preserveAspectRatio", "xMinYMid")
				.attr("class", "YlOrRd");

			var deps = svg.append("g");

			d3.json("departmentsLux.json", function(req, geojson) {
				var features = deps
					.selectAll("path")
					.data(geojson.features)
					.enter()
					.append("path")
					.attr('id', function(d) {return "d" + d.properties.cartodb_id;})
					.attr("d", path);

				d3.csv("fichier.csv", function(csv) {
					// Quantile scales map an input domain to a discrete range, 0...max(population) to 1...9
					var quantile = d3.scaleQuantile()
						.domain([d3.min(csv, function(e) { return (((Math.abs(e.Norme_max_calc-e.Norme_max)) + (Math.abs(e.Norme_min_calc-e.Norme_min)))/2);
															}), d3.max(csv, function(e) { return (((Math.abs(e.Norme_max_calc-e.Norme_max)) + (Math.abs(e.Norme_min_calc-e.Norme_min)))/2);
															})])
						.range(d3.range(9));

					var legend = svg.append('g')
						.attr('transform', 'translate(375, 150)')
						.attr('id', 'legend');

					legend.selectAll('.colorbar')
						.data(d3.range(9))
					  .enter().append('svg:rect')
						.attr('y', function(d) { return d * 20 + 'px'; })
						.attr('height', '20px')
						.attr('width', '20px')
						.attr('x', '0px')
						.attr("class", function(d) { return "q" + d + "-9"; });

					var legendScale = d3.scaleLinear()
						.domain([d3.min(csv, function(e) { return (((Math.abs(e.Norme_max_calc-e.Norme_max)) + (Math.abs(e.Norme_min_calc-e.Norme_min)))/2);
															}), d3.max(csv, function(e) { return (((Math.abs(e.Norme_max_calc-e.Norme_max)) + (Math.abs(e.Norme_min_calc-e.Norme_min)))/2);
															})])
						.range([0, 9 * 20]);

					var legendAxis = svg.append("g")
						.attr('transform', 'translate(400, 150)')
						.call(d3.axisRight(legendScale).ticks(6));

					csv.forEach(function(e,i) {
						d3.select("#d" + e.Cartodb_id)
							.attr("class", function(d) { return "department q" + quantile(((Math.abs(e.Norme_max_calc-e.Norme_max)) + (Math.abs(e.Norme_min_calc-e.Norme_min)))/2) + "-9"; })
							.on("mouseover", function(d) {
								div.transition()
									.duration(200)
									.style("opacity", .9);
								div.html("<b>Commune : </b>" + e.Communes + "<br>"
										+ "<b>Norme max calc : </b>" + e.Norme_max_calc + " ; " + "<b>Norme max : </b>" + e.Norme_max + "<br>"
										+ "<b>Norme min calc : </b>" + e.Norme_min_calc + " ; " + "<b>Norme min : </b>" + e.Norme_min)
									.style("left", (d3.event.pageX + 30) + "px")
									.style("top", (d3.event.pageY - 30) + "px");
							})
							.on("click", function(d) {
								d3.select("#ville").html(e.Communes);
							})
							.on("mouseout", function(d) {
								div.transition()
									.duration(500)
									.style("opacity", 0);
								div.html("")
									.style("left", "0px")
									.style("top", "0px");
							});
					});
				});
			});

			d3.select("select").on("change", function() {
				d3.selectAll("svg").attr("class", this.value);
			});

			var div = d3.select("#map").append("div")
				.attr("class", "tooltip")
				.style("opacity", 0);



			d3.json("data.json", draw); // "data.json"

}
function search_carte(){
	console.log("search_carte");
	update();
}