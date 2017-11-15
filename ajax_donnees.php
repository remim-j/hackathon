<?php
	$db = mysqli_connect('localhost','root','','analyse')
			or die('Error connecting to MySQL server.');

	$ville = $_POST['ville'];
	$ageMin = $_POST['age_min'];
	$ageMax = $_POST['age_max'];
	$sexe = $_POST['sexe'];
	$analyse = $_POST['type'];
	$reponse = mysqli_query($db, "SELECT id_type FROM type_an WHERE type = '$analyse'");
	$analyseId = mysqli_fetch_assoc($reponse)['id_type'];
	
	$query = "select valeur from analyse, personne where ref_personne = id_personne";
	if(!empty($ville)){
		$query .= " and ville = '$ville' ";
	}
	if(!empty($ageMin)){
		$query .= " and age >= ".$ageMin. " ";
	}
	if(!empty($ageMax)){
		$query .= " and age <= ".$ageMax." ";
	}
	if(!empty($sexe)){
		$query .= " and sexe = ".$sexe." ";
	}
	if(!empty($analyseId)){
		$query .= " and ref_type = ".$analyseId;
	}
	echo($query);
	// $personne = query('select valeur, age, sexe, ville from analyse, personne where id_analyse = '$id_analyse' and ref_personne = id_personne'); // On r�cup�re les informations sur la personne � partir des l'id de l'analyse
	$reponse = mysqli_query($db, $query); /*On recupere toutes les valeurs e toutes les personnes qui correspondent aux donn�es demand�es. Il faut modifier la requ�te en fonction des donn�es manquantes.*/

	$rows = array();
	while($row = mysqli_fetch_assoc($reponse))
	{
		array_push($rows, intval(implode($row)));
	}
	
	if (sizeOf($rows) <= 10 and !empty($ville)) {	// On verifie qu'on a assez de resultats pour effectuer un mesure pertinente
		$queryCom = "select Commune from ville_to_commune where nom = '$ville'";
		$reponseCom = mysqli_query($db, $queryCom);
		$commune = implode(mysqli_fetch_assoc($reponseCom));
		$query = preg_replace("#ville = [^ ]+#","(ville in (select ville from ville_to_commune where commune = '$commune'))",$query); // On remplace la ville par la commune
		echo $query;
		$reponse = mysqli_query($db, $query); 

		$rows = array();
		while($row = mysqli_fetch_assoc($reponse))
		{
		array_push($rows, intval(implode($row)));
		}

	}

	sort($rows); /* Trie r�ponse */
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
