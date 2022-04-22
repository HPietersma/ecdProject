<?php

$request_body = file_get_contents('php://input');
$data = json_decode($request_body, true);

$client_id;

$voornaam = "";
$achternaam = "";
$telefoon = "";
$geboortedatum = "";
$email = "";
$adres = "";
$plaats = "";

$reanimeren = true;

$aandoeningen = null;

$medicatie = null;

// NAW
    if (isset($data['NAW']['voornaam'])) {
        $voornaam = $data['NAW']['voornaam'];
    };
    if (isset($data['NAW']['achternaam'])) {
        $achternaam = $data['NAW']['achternaam'];
    };
    if (isset($data['NAW']['telefoon'])) {
        $telefoon = $data['NAW']['telefoon'];
    };
    if (isset($data['NAW']['geboortedatum'])) {
        $geboortedatum = $data['NAW']['geboortedatum'];
    };
    if (isset($data['NAW']['email'])) {
        $email = $data['NAW']['email'];
    };
    if (isset($data['NAW']['adres'])) {
        $adres = $data['NAW']['adres'];
    };
    if (isset($data['NAW']['plaats'])) {
        $plaats = $data['NAW']['plaats'];
    };

// REANIMEREN
    if (isset($data['reanimeren'])) {
        $reanimeren = $data['reanimeren'];
    };

// AANDOENINGEN
    if (isset($data['aandoeningen'])) {
        foreach ($data['aandoeningen'] as $key => $value) {
            if ($value) {
                if (!empty($value['item'])) {
                    $aandoeningen[] = $value;
                };
            };
        };
    };

// MEDICATIE
    if (isset($data['medicatie'])) {
        foreach ($data['medicatie'] as $key => $value) {
            if ($value) {
                if (!empty($value['item'])) {
                    $medicatie[] = $value;
                };
            };
        };
    };



// QUERIES
    $sql_clienten = 
        "INSERT INTO clienten (voornaam, achternaam, geboortedatum, telefoon, email, adres, plaats)
        VALUES ('$voornaam', '$achternaam', '$geboortedatum', '$telefoon', '$email', '$adres', '$plaats')
    ";


    if (isset($data)) {
        if (mysqli_query($con, $sql_clienten) == true) {
            $client_id = mysqli_insert_id($con);
        }
        else {
            die();
        }
    }
    else {
        die();
    };

    // REANIMEREN
        $sql_reanimeren = 
            "INSERT INTO reanimeren (client_id, reanimeren)
            VALUES ('$client_id', '$reanimeren')
        ";
        mysqli_query($con, $sql_reanimeren);

    // AANDOENINGEN
        if ($aandoeningen) {
            foreach ($aandoeningen as $key => $value) {
                $item = $value['item'];
                $sql_aandoeningen = 
                    "INSERT INTO aandoeningen (client_id, aandoening)
                    VALUES ('$client_id', '$item')
                ";
                mysqli_query($con, $sql_aandoeningen);
            };
        };


    // MEDICATIE
        if ($medicatie) {
            foreach ($medicatie as $key => $value) {
                $item = $value['item'];
                $sql_medicatie = 
                    "INSERT INTO medicatie (client_id, medicatie)
                    VALUES ('$client_id', '$item')
                ";
                mysqli_query($con, $sql_medicatie);
            }; 
        };





 
$json = array(
    "succes"=>true,
    "message"=>"client is toegevoegd",
    "data"=>$data,
);
    



   
   
   
   
    //$res = mysqli_query($con, $sql_reanimeren);   
    



    // $json = array(
    //     "succes"=>false,
    //     "data"=>$data,
    // );

?>
