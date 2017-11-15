<!DOCTYPE html>
<?php
function tep_select ($name, $options=array(), $value=NULL, $paramfoo=NULL) {
global $_GET, $_POST;
$paramfoo = ((!empty($paramfoo)) ? ' '.$paramfoo : '');
echo '<input type="select" name="'.$name.'" ng-model="'.$name.'" ' .$paramfoo. '>';
if (isset($_GET[$name]))
	$value = $_GET[$name];
elseif (isset($_POST[$name]))
$value = $_POST[$name];
elseif (empty($value))  $value = '';
if (array_key_exists($value,$options))
$value = $options[$value];
$strfound = false;
foreach ($options as $opt => $str) {
	if ($str==$value && !$strfound) {
		$selectedfoo = ' selected';
		$strfound = true;
	}
	else
	 $selectedfoo = '';
	 echo '<option value="'.$opt.'"' .$selectedfoo. '>'.$str.'</option>';
 }
 if (!empty($value) && !$strfound)
 echo '<option value="'.$value.'" selected>'.$value.'</option>';
 echo '</select>';
}

$db = mysqli_connect('localhost','root','','analyse')
		or die('Error connecting to MySQL server.');
		$reponse = mysqli_query($db, "SELECT DISTINCT type FROM type_an");
		$array = $reponse->fetch_all();
?>
	<head>

		<!-- Encodage -->
		<meta charset="UTF-8">

		<!-- jQuery -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

		<!-- Librairie D3.js -->
        <script src="https://d3js.org/d3.v4.js"></script>

		<!-- Feuille de style -->
		<link rel="stylesheet" type="text/css" href="style.css">

		<!-- Bootstrap -->
		<link data-require="bootstrap-css@3.0.0-rc2" data-semver="3.0.0-rc2" rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0-rc2/css/bootstrap.min.css" />

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
	</head>

	<body ng-app="app">

		<h1>Laboratoire Luxembourgeois d'analyses médicales Ketterthill - LLAM S.A.</h1>
		<h2>Outil de calcul de la norme des analyses numériques</h2>

		<div class="col-lg-10">
			<form>
				<fieldset>
					<div style='margin-left: 340px; margin-bottom: 10px; margin-top: 30px;'>
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

				<div ng-controller="MainCtrl" style='flex: 0 0 270px;'>
					<div class="container form-group col-md-7">
						<div style='margin-down: 10px;'>Define your filters :</div>
						<!--<?php tep_select('analysis_type', $array,NULL, NULL); ?>-->
						<input ng-model="analysis_type" type="select" placeholder="Analysis type"/>
						<input type="checkbox"/> Male
						<input type="checkbox"/> Female
						<input ng-model="age_min" type="text" placeholder="Age Min"/>
						<input ng-model="age_max" type="text" placeholder="Age Max"/>
					</div>
				</div>

				<div id="map"></div>

				<div id="resultHBD"></div>
			</div>
		</p>

		<p>Affichage résultats php

		<button type="button" id="result">Click Me</button>

		<div id="resultatsPHP"></div>

		</p>

	</body>
		<script type="text/javascript" src="js/carte.js"></script>
			<script type="text/javascript" src="js/controle.js"></script>
</html>
