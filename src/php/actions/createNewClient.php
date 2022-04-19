<?php

$request_body = file_get_contents('php://input');
$data = json_decode($request_body, true);

$voornaam = "";
$achternaam = "";
$telefoon = "";
$geboortedatum = "";
$email = "";
$adres = "";
$plaats = "";

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


    $sql = "INSERT INTO clienten (voornaam, achternaam, geboortedatum, telefoon, email, adres, plaats)
            VALUES ('$voornaam', '$achternaam', '$geboortedatum', '$telefoon', '$email', '$adres', '$plaats')
            ";

    $res = mysqli_query($con, $sql);   


    $json = array(
        "succes"=>false,
        "data"=>$data,
    );

?>
