<?php

$request_body = file_get_contents('php://input');
$data = json_decode($request_body, true);

$client_id = null;
$klas_id = null;
$naam = null;
$users = null;
$usedNames = [];

if (isset($data['client_id'])) {
    $client_id = $data['client_id'];
};

if (isset($data['klas_id'])) {
    $klas_id = $data['klas_id'];
};

if (isset($data['naam'])) {
    $naam = $data['naam'];
};


$sql_casussen = "SELECT DISTINCT casus.naam
        FROM `casus` 
        LEFT JOIN users on casus.user_id = users.id
        WHERE users.klas_id = '$klas_id'
    ";
$res_casussen = mysqli_query($con, $sql_casussen);   
if($res_casussen) {
    while($row = mysqli_fetch_assoc($res_casussen)) {
        $usedNames[] = $row['naam'];
    }
}

if (in_array($naam, $usedNames)) {
    $json = array(
        "meta"=>array (
            "succes"=>false,
            "message"=>"Naam is al in gebruik, bedenk een andere naam voor deze casus"
        ),
        "data"=>$data,
    );
}
else {
    $sql_getUsers = 
        "SELECT id
        FROM `users` 
        WHERE klas_id = '$klas_id'"
    ;

    $res = mysqli_query($con, $sql_getUsers);   
    if($res) {
        while($row = mysqli_fetch_assoc($res)) {
            $users[] = $row['id'];
        }
    }

    if ($users) {
        foreach ($users as $key => $value) {
            $sql_insert = 
                "INSERT INTO casus (naam, user_id, client_id)
                VALUES ('$naam', '$value', $client_id)
            ";
            mysqli_query($con, $sql_insert);
        }; 
    };

    $json = array(
        "meta"=>array (
            "succes"=>true,
            "message"=>"Nieuwe casus aangemaakt."
        ),
        "data"=>$data,
    );
}























?>