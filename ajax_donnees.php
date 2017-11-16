<?php
	$db = mysqli_connect('localhost','root','','analyse')
			or die('Error connecting to MySQL server.');

$ageMin = $_POST['age_min'];
$ageMax = $_POST['age_max'];
$sexe = $_POST['sexe'];
$analyse = $_POST['type'];

//if(!isset($_POST['group']))
//{
	$ville = $_POST['ville'];
	$reponse = mysqli_query($db, "SELECT id_type FROM type_an WHERE type = '$analyse'");
	$analyseId = mysqli_fetch_assoc($reponse)['id_type'];
	
	$query = "select valeur,date from analyse, personne,ville_to_commune where ville = nom and ref_personne = id_personne";
	if(!empty($ville)){
		$query .= " and commune = '$ville' ";
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
	$query.=" order by date";
	// $personne = query('select valeur, age, sexe, ville from analyse, personne where id_analyse = '$id_analyse' and ref_personne = id_personne'); // On r�cup�re les informations sur la personne � partir des l'id de l'analyse
	$reponse = mysqli_query($db, $query); /*On recupere toutes les valeurs e toutes les personnes qui correspondent aux donn�es demand�es. Il faut modifier la requ�te en fonction des donn�es manquantes.*/

	$rows = array();
	$keys = array('y');
	$rows2 = array();
	$rowsTemp = array();
	
	$chemin = 'data.csv';
	$delimiteur = ',';
	$fichier_csv = fopen($chemin, 'w+');
	$header = array('date','close');
	fputcsv($fichier_csv, $header, $delimiteur);
	while($row = mysqli_fetch_assoc($reponse))
	{
		fputcsv($fichier_csv, array($row['date'],$row['valeur']), $delimiteur);
		
		$rows[] = $row['valeur'];
		$rowsTemp = array_fill_keys($keys, intval($row['valeur']));
		array_push($rows2, $rowsTemp);
	}
	fclose($fichier_csv);
	sort($rows);
	sort($rows2); /* Trie r�ponse */

	/*Les lignes ci-dessous sont pertinentes si count($reponse) > 10, environ */
	
	$norme_min = $rows[intval((2.5/100)*sizeOf($rows))];// Retourne la valeur � 2.5%
	$norme_max = $rows[intval((97.5/100)*sizeOf($rows))];// Retourne la valuer � 97.5%
	/* if (count($rows) >= 10){ Si on a suffisamment de r�sultats sur la ville */

	$sizeRows = sizeOf($rows);
	$rowsJson = json_encode($rows2);
	$response = array('dataJson' => $rowsJson, 'normeMin' => $norme_min, 'normeMax' => $norme_max, 'nbRows' => $sizeRows);
	echo json_encode($response);

	/* } */

	$reponse->close(); /*Termine le traitement de la requ�te*/
//}
//else
//{
	$chemin = 'fichier.csv';
	$delimiteur = ',';

	$reponse = mysqli_query($db, "SELECT id_type,norme_min,norme_max FROM type_an WHERE type = '$analyse'");
	$row = mysqli_fetch_assoc($reponse);
	$analyseId = $row['id_type'];
	$norme_min = $row['norme_min'];
	$norme_max = $row['norme_max'];
	$query = "select commune,COUNT(*),cartodb_id,echelle from analyse, personne,ville_to_commune,commune_to_canton where ref_personne = id_personne and ville = nom and commune = communes";
	$queryPlus="";
	if(!empty($ageMin)){
		$queryPlus .= " and age >= ".$ageMin. " ";
	}
	if(!empty($ageMax)){
		$queryPlus .= " and age <= ".$ageMax." ";
	}
	if(!empty($sexe)){
		$queryPlus .= " and sexe = ".$sexe." ";
	}
	if(!empty($analyseId)){
		$queryPlus .= " and ref_type = ".$analyseId;
	}
	$query.= $queryPlus." GROUP BY commune";
	
	if(!($reponseCom = mysqli_query($db, $query)))
	{echo $db->error;return;}
	$tab = array();
	while($row = mysqli_fetch_array($reponseCom))
	{
		$query = 'select valeur from analyse, personne,ville_to_commune where ref_personne = id_personne and ville = nom and commune = "'.$row[0].'"' .$queryPlus;
		
		//$tab[$row[0]] = array('value' => $row[1],'id'=> $row[2],'echelle'=>$row[3]);
		$values = array();
		if(!($reponse = mysqli_query($db, $query)))
		{echo $query;return;}
		while($row2 = mysqli_fetch_array($reponse))
		{
			$values[] = $row2[0];
		}
		sort($values);
		$norme_min_calc = $values[intval((2.5/100)*sizeOf($values))];// Retourne la valeur � 2.5%
		$norme_max_calc = $values[intval((97.5/100)*sizeOf($values))];// Retourne la valuer � 97.5%
		$tab[$row[0]] = ['count' => $row[1], 'norme_min_calc' => $norme_min_calc, 'norme_max_calc' => $norme_max_calc,'id'=> $row[2],'echelle'=>$row[3]];
	}
	$fichier_csv = fopen($chemin, 'w+');
	$cpt=1;
	$header = array('id','Communes','Count','Norme_max_calc','Norme_min_calc','Norme_max','Norme_min','Cartodb_id','Echelle');
	fputcsv($fichier_csv, $header, $delimiteur);
	foreach($tab as $line)
	{
		$ligne = array($cpt,array_search($line,$tab),$line['count'],$line['norme_max_calc'],$line['norme_min_calc'],$norme_min,$norme_max,$line['id'],$line['echelle']);
		fputcsv($fichier_csv, $ligne, $delimiteur);
		$cpt+=1;
	}
	fclose($fichier_csv);
//}
?>