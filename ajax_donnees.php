<?php
	$db = mysqli_connect('localhost','root','','analyse')
			or die('Error connecting to MySQL server.');

	$ville = 'LUXEMBOURG';
	$ageMin = 20;
	$ageMax = 20;
	$sexe = 2;
	$analyseId = 42;
	
	$query = "select valeur from analyse, personne, type_an where ";
	$c = 0;
	if(isset($ville)){
		$query .= "ville = '$ville' ";
		$c = 1;
	}
	if(isset($ageMin)){
		if($c){
			$query .= "and ";
			$c = 0;
		}
		$query .= "age >= ".$ageMin. " ";
		$c = 1;
	}
	if(isset($ageMax)){
		if($c){
			$query .= "and ";
			$c = 0;
		}
		$query .= "age <= ".$ageMax." ";
		$c = 1;
	}
	if(isset($sexe)){
		if($c){
			$query .= "and ";
			$c = 0;
		}
		$query .= "sexe = ".$sexe." ";
		$c = 1;
	}
	if(isset($analyseId)){
		if($c){
			$query .= "and ";
			$c = 0;
		}
		$query .= "ref_type = ".$analyseId;
	}
	
	// $personne = query('select valeur, age, sexe, ville from analyse, personne where id_analyse = '$id_analyse' and ref_personne = id_personne'); // On r�cup�re les informations sur la personne � partir des l'id de l'analyse
	$reponse = mysqli_query($db, $query); /*On recupere toutes les valeurs e toutes les personnes qui correspondent aux donn�es demand�es. Il faut modifier la requ�te en fonction des donn�es manquantes.*/

	$rows = array();
	while($row = mysqli_fetch_assoc($reponse))
	{
		array_push($rows, intval(implode($row)));
	}

	asort($rows); /* Trie r�ponse */
	
	$rowsJson = json_encode($rows);

	/*Les lignes ci-dessous sont pertinentes si count($reponse) > 10, environ */
	$norme_min = $rows[intval((2.5/100)*sizeOf($rows))];// Retourne la valeur � 2.5%
	$norme_max = $rows[intval((97.5/100)*sizeOf($rows))];// Retourne la valuer � 97.5%
	/* if (count($rows) >= 10){ Si on a suffisamment de r�sultats sur la ville */

	$sizeRows = sizeOf($rows);
	
	$response = array('dataJson' => $rowsJson, 'normeMin' => $norme_min, 'normeMax' => $norme_max, 'nbRows' => $sizeRows);
	echo json_encode($response);

	/* } */

	$reponse->close(); /*Termine le traitement de la requ�te*/

?>
