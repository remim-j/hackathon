<?php
//Upload
$sourcePath = $_FILES['file']['tmp_name'];
	
$targetPath = "upload/".$_FILES['file']['name'];
if(pathinfo($targetPath, PATHINFO_EXTENSION) != "csv"){
	header('HTTP/1.1 500 Internal Server Booboo');
	die();
}
move_uploaded_file($sourcePath,$targetPath);

//Store
ini_set('max_execution_time', 0);
$mysqli = new mysqli('localhost','root','','analyse'); // First paramater stands for host, Second for Database-user, Third stand for Database-password, Forth Database-name.
/* Vérification de la connexion */
if ($mysqli->connect_errno) {
  printf("Échec de la connexion : %s\n", $mysqli->connect_error);
  exit();
}
$d1 = date_create('now');

$handle = fopen($targetPath,"r");
fgetcsv($handle, 1000, ";");

$stmt_select_personne = $mysqli->prepare("SELECT id_personne FROM personne WHERE age = ? AND sexe = ? AND ville = ?");
$stmt_select_personne->bind_param("iis", $age, $sexe,$ville);
$stmt_insert_personne = $mysqli->prepare("INSERT INTO personne (age, sexe, ville) VALUES (?,?,?)");
$stmt_insert_personne->bind_param("iis", $age, $sexe,$ville);

$stmt_select_type = $mysqli->prepare("SELECT id_type FROM type_an WHERE type = ?");
$stmt_select_type->bind_param("s",$type);
$stmt_insert_type = $mysqli->prepare("INSERT INTO type_an (type, norme_min, norme_max) VALUES (?,?,?)");
$stmt_insert_type->bind_param("sss", $type, $min,$max);

$stmt_insert_analyse = $mysqli->prepare("INSERT INTO analyse (ref_type, ref_personne, valeur, unite, date) VALUES (?,?,?,?,?)");
$stmt_insert_analyse->bind_param("iidss", $id_type,$id_personne, $valeur,$unite,$date);

    //loop through the csv file and insert into database
while ($data = fgetcsv($handle,1000,";"))
{
  if (sizeof($data) == 12)
  {
    //Traitement table personne
    $datetime1 = DateTime::createFromFormat('Y-m-d',$data[9]);
    $datetime2 = DateTime::createFromFormat('Y-m-d',$data[1]);
    $interval = $datetime1->diff($datetime2);

    $age = $interval->format('%Y');
    $sexe = $data[2];
    $ville = $data[4];

    $stmt_select_personne->execute();
    $result = $stmt_select_personne->get_result();

    if($result->num_rows >0)
    {
      $id_personne = $result->fetch_assoc()['id_personne'];
    }
    else
    {
      $stmt_insert_personne->execute();
      $id_personne = $mysqli->insert_id;
    }
    $result->close();
    //Traitement table type_an
    $type = $data[11];
    $stmt_select_type->execute();
    $result = $stmt_select_type->get_result();
    if($result->num_rows > 0)
    {
      $id_type = $result->fetch_assoc()['id_type'];
    }
    else
    {
      $min = NULL;
      $max = NULL;
      if(strpos($data[10], '\\') !== FALSE)
      {
        $array = explode('\\',$data[10]);
        $min = empty($array[0]) ? NULL : $array[0];
        $max = empty($array[1]) ? NULL : $array[1];
      }
      if(!$stmt_insert_type->execute())
      {
        echo $mysqli->error;
      }
      $id_type = $mysqli->insert_id;
    }
    $result->close();

    //Traitement table analyse
    $valeur = $data[7] * pow(10,$data[8]);
    $unite = (sizeof(explode(' ', $data[5])) > 1 ? addslashes(explode(' ', $data[5])[sizeof(explode(' ', $data[5]))-1]) : NULL);
    $date = $datetime1->format("Y-m-d");
    if(!$stmt_insert_analyse->execute())
	{
        echo $mysqli->error;
	}
  }
}
$d2 = date_create('now');
echo $d2->diff($d1)->format('%H:%i:%s');
//echo "Succès";
$mysqli->close();
?>
