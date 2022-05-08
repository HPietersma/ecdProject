<?php


$request_body = file_get_contents('php://input');
$data = json_decode($request_body, true);



$klas_id = null;

if (isset($data['klas_id'])) {
    $klas_id = $data['klas_id'];
};


$casussen = null;
$users = null;
$klas = null;

$sql_casussen = "SELECT DISTINCT casus.naam
        FROM `casus` 
        LEFT JOIN users on casus.user_id = users.id
        WHERE users.klas_id = '$klas_id'
    ";
$res_casussen = mysqli_query($con, $sql_casussen);   
if($res_casussen) {
    while($row = mysqli_fetch_assoc($res_casussen)) {
        $casussen[] = $row['naam'];
    }
}

$sql_users = "SELECT id, voornaam, achternaam
        FROM `users` 
        WHERE klas_id = '$klas_id'
    ";
$res_users = mysqli_query($con, $sql_users);   
if($res_users) {
    while($row = mysqli_fetch_assoc($res_users)) {
        $users[] = $row;
    }
}



    
foreach ($users as $key => $value) {
    $userCasussen = null;
    $id = $value['id'];

    if ($casussen) {
        foreach ($casussen as $key => $value2) {
            $sql = "SELECT id, naam, status, user_id, client_id
                FROM `casus` 
                WHERE naam = '$value2' AND user_id = $id
            ";
            $res = mysqli_query($con, $sql);   
            if(mysqli_num_rows($res) > 0) {
                while($row = mysqli_fetch_assoc($res)) {
                    $userCasussen[] = $row;
                }
            }
            else {
                $userCasussen[] = ["status" => "0"];
            }
        };
    }
    $user = array (
        "user" => $value,
        "casussen" => $userCasussen,
    );

    $klas[] = $user;
}



$json = array(
    "succes"=>true,
    "data"=> array (
        "casussen"=>$casussen,
        "klas"=>$klas,
    ),
);






 












?>








