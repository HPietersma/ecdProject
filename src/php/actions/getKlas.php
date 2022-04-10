<?php


$request_body = file_get_contents('php://input');
$data = json_decode($request_body, true);

$klas_id = "";

if (isset($data['klas_id'])) {
    $klas_id = $data['klas_id'];
};


$klas = array();

    $sql = "SELECT id, username, email
            FROM `users` 
            WHERE klas_id = '$klas_id'
        ";
    $res = mysqli_query($con, $sql);   
    if($res) {
        while($row = mysqli_fetch_assoc($res)) {
            $klas[] = $row;
        }
    }





$json = array(
    "succes"=>true,
    "data"=>$klas,
);





 












?>








