<!DOCTYPE html>
	<head>

		<!-- Encodage -->
		<meta charset="UTF-8">

		<!-- jQuery -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<link rel="stylesheet" href="/resources/demos/style.css">
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		
		<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.min.js"></script>

		<!-- Librairie D3.js -->
        <script src="https://d3js.org/d3.v4.js"></script>
		<script src="https://d3js.org/d3.v4.min.js"></script>

		<!-- Feuille de style -->
		<link rel="stylesheet" type="text/css" href="style.css">

		<!-- Bootstrap -->
		<link data-require="bootstrap-css@3.0.0-rc2" data-semver="3.0.0-rc2" rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0-rc2/css/bootstrap.min.css" />

		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.0.0/bootstrap-slider.js"></script>
		
		<!-- AngularJS -->
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-animate.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-aria.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-messages.min.js"></script>

		<!-- Dates en français -->
		<script src="angular-locale_fr-fr.js"></script>

		<!-- Angular-material -->
		<script src="https://cdn.gitcdn.link/cdn/angular/bower-material/v1.1.5/angular-material.js"></script>

		<!-- Titre -->
		<title>Hackaton Big Data</title>
		
		<style>

		.line {
		  fill: none;
		  stroke: steelblue;
		  stroke-width: 2px;
		}
		</style>
	</head>

	<body ng-app="app">
	
			<div id="headers" style="margin-top:10px;">
	
				<h3 class="title">Laboratoire Luxembourgeois d'analyses médicales Ketterthill - LLAM S.A.</h1>
				<h3 class="title">Outil de calcul de la norme des analyses numériques</h2>
				
			</div>

		
		
		<div class="col-lg-10">
			<form>
				<fieldset>
					<div style='margin-left: 380px; margin-bottom: 10px; margin-top: 40px;'>
						<label for="male">Jeu de couleurs</label>
						<select>
							<option value="YlGn">Jaune-Vert</option>
							<option value="YlGnBu">Jaune-Vert-Bleu</option>
							<option value="GnBu">Vert-Bleu</option>
							<option value="BuGn">Bleu-Vert</option>
							<option value="PuBuGn">Violet-Bleu-Vert</option>
							<option value="PuBu">Violet-Bleu</option>
							<option value="BuPu">Bleu-Violet</option>
							<option value="RdPu">Rouge-Violet</option>
							<option value="PuRd">Violet-Rouge</option>
							<option value="OrRd">Orange-Rouge</option>
							<option value="YlOrRd" selected="selected">Jaune-Orange-Rouge</option>
							<option value="YlOrBr">Jaune-Orange-Marron</option>
							<option value="Purples">Violets</option>
							<option value="Blues">Bleu</option>
							<option value="Greens">Vert</option>
							<option value="Oranges">Orange</option>
							<option value="Reds">Rouge</option>
							<option value="Greys">Gris</option>
						</select>
					</div>
				</fieldset>
			</form>
		</div>

		<p>
			<div id="boards">

				<div id="colG">
					<div id="colG">
						<div><h2>Choix des filtres</h2></div>
						<div style="margin-top:10px;"><label style="font-weight: bold;">Ville selectionnée :&nbsp;</label><label id="ville" style="font-weight: normal;"></label></div>
						
						<div style="margin-top:10px;">
							<select id="analyse_type" style="max-width: 150px;" onchange="search()">
							<option value= "default">Type d'analyse</option>
							<?php
							$db = mysqli_connect('localhost','root','','analyse')
									or die('Error connecting to MySQL server.');
									$reponse = mysqli_query($db, "SELECT DISTINCT type FROM type_an ORDER BY type");
							while ($data = $reponse->fetch_assoc())
							{
							  ?>
							  <option value="<?php echo $data['type']; ?>"><?php echo $data['type']; ?></option>
							<?php }?></select>
						</div>
						
						<div style="margin-top:10px;"><input type="checkbox" id="h"/> Homme</div>
						<div style="margin-top:10px;"><input type="checkbox" id="f"/> Femme</div>
						
						<div style="margin-top:10px;">
						<label for="amount" style="font-weight: bold;">Tranche d'âge :</label>
						<input type="text" id="amount" readonly style="border:0; color:#f6931f;">
						</div>

						<div style="margin-top:10px;">
						<div id="slider-range" style="max-width: 150px;"></div>
						</div>
						
						<div style="margin-top:20px;"><button type="button" class="btn btn-primary" id="result">Filtrer</button></div>
							<div id="loader_filter"></div>
						
					</div>
					
					<div id="colG">
					
						<div style="margin-top:30px;"><h2>Base de données</h2></div>
						
						<div style="margin-top:20px;"><button type="button" class="btn btn-danger" onclick="showHideImport()">Importation</button></div>
						
						<div id="importDIV" style="display:none;">
							<form id="uploadAndImport" method="post" enctype="multipart/form-data">
							<input type="file" name="file" id="file" required/>
							<input id="sub" type="submit" value="Importer" class="submit"/>
							</form>
							<div id="loader_import"></div>
						</div>
					</div>
				</div>

				<div id="map" style="border:1px solid black;"></div>
				
				<div id="colD" style="margin-left:15px;">
					<div><label><h3 style="font-weight: bold;">Résultat</h3></label></div>
					<div id="chartContainer" style="height: 370px; width: 100%;"></div>
					<div id="resultatsPHP" style="margin-top:10px;"></div>
					
				</div>
			</div>
		</p>
		<div id="chart"></div>
	</body>
		<script type="text/javascript" src="js/carte.js"></script>
		<script type="text/javascript" src="js/chart_d3.js"></script>
			<script type="text/javascript" src="js/controle.js"></script>
</html>
