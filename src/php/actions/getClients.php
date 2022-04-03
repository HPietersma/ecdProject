<?php

$sql = "SELECT id, voornaam, achternaam, geboortedatum
        FROM `clienten` 
        ";

$res = mysqli_query($con, $sql);   
if($res) {
    $lst = array();

    while($row = mysqli_fetch_assoc($res)) {

        $lst[] = $row;

    }

    $json = array(
        "succes"=>true,
        "data"=>$lst
    );


}
else {
    $json = array(
        "succes"=>false,
        "data"=>null
    );
}
 


?>
