<?php

	$db = mysqli_connect('localhost','root','','analyse')
			or die('Error connecting to MySQL server.');
		
	echo 'Bonjour <br>';

	// $personne = query('select valeur, age, sexe, ville from analyse, personne where id_analyse = '$id_analyse' and ref_personne = id_personne'); // On récupère les informations sur la personne à partir des l'id de l'analyse
	$reponse = mysqli_query($db, 'select valeur from analyse, personne, type_an where ville = \'LUXEMBOURG\' and age >= 20 and age <= 20 and sexe = 2 and ref_type = 42'); /*On recupere toutes les valeurs e toutes les personnes qui correspondent aux données demandées. Il faut modifier la requête en fonction des données manquantes.*/
	
	$rows = array();
	while($row = mysqli_fetch_assoc($reponse))
	{
		array_push($rows, intval(implode($row)));
		echo 'Row : ' . intval(implode($row)) . '<br>';
	}
	
	print_r($rows);

	asort($rows); /* Trie réponse */
	
	print_r($rows);
	
	/*Les lignes ci-dessous sont pertinentes si count($reponse) > 10, environ */
	$norme_min = $rows[intval((2.5/100)*sizeOf($rows))];// Retourne la valeur à 2.5%
	$norme_max = $rows[intval((97.5/100)*sizeOf($rows))];// Retourne la valuer à 97.5%
	/* if (count($rows) >= 10){ Si on a suffisamment de résultats sur la ville */

	echo '<br><br>Resultats d\'analyse issus de la commune de : LUXEMBOURG <br>'
	. 'Le norme pour de tels resutats d\'analyse dans la commune est comprise entre ' . $norme_min . ' et ' . $norme_max . '<br>'
	. 'Ces resultats ont ete calcules sur ' . sizeOf($rows);

	/* } */

	$reponse->close(); /*Termine le traitement de la requête*/

?>