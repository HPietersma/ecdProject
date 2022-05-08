<?php


$request_body = file_get_contents('php://input');
$data = json_decode($request_body, true);

$client_id;

if (isset($data['client_id'])) {
    $client_id = $data['client_id'];
};


$aandoeningen = null;
$afspraken = null;
$allergien = null;
$behandelplan = null;
$contactpersonen = null;
$hulpmiddelen = null;
$medicatie = null;
$client = null;

if (isset($client_id)) {
    //AANDOENINGEN
        $sql = "SELECT aandoening
                FROM `aandoeningen` 
                WHERE client_id = '$client_id'
            ";
        $res = mysqli_query($con, $sql);   
        if($res) {
            while($row = mysqli_fetch_assoc($res)) {
                $aandoeningen[] = $row;
            }
        }

    //AFSPRAKEN
        // $sql = "SELECT created, datum, tijd, notitie
        //         FROM `afspraken` 
        //         WHERE client_id = '$client_id'
        //     ";
        // $res = mysqli_query($con, $sql);   
        // if($res) {
        //     while($row = mysqli_fetch_assoc($res)) {
        //         $afspraken[] = $row;
        //     }
        // }

    //ALLERGIE
        $sql = "SELECT allergie
                FROM `allergien` 
                WHERE client_id = '$client_id'
            ";
        $res = mysqli_query($con, $sql);   
        if($res) {
            while($row = mysqli_fetch_assoc($res)) {
                $allergien[] = $row;
            }
        }

    //BEHANDELPLAN
        $sql = "SELECT behandelplan
                FROM `behandelplan` 
                WHERE client_id = '$client_id'
            ";
        $res = mysqli_query($con, $sql);   
        if($res) {
            while($row = mysqli_fetch_assoc($res)) {
                $behandelplan[] = $row;
            }
        }

    //CONTACTPERSONEN
        $sql = "SELECT contactpersoon, telefoon, email, adres, plaats
                FROM `contactpersonen` 
                WHERE client_id = '$client_id'
            ";
        $res = mysqli_query($con, $sql);   
        if($res) {
            while($row = mysqli_fetch_assoc($res)) {
                $contactpersonen[] = $row;
            }
        }

    //HULPMIDDELEN
        $sql = "SELECT hulpmiddel
                FROM `hulpmiddelen` 
                WHERE client_id = '$client_id'
            ";
        $res = mysqli_query($con, $sql);   
        if($res) {
            while($row = mysqli_fetch_assoc($res)) {
                $hulpmiddelen[] = $row;
            }
        }

    //MEDICATIE
        $sql = "SELECT medicatie
                FROM `medicatie` 
                WHERE client_id = '$client_id'
            ";
        $res = mysqli_query($con, $sql);   
        if($res) {
            while($row = mysqli_fetch_assoc($res)) {
                $medicatie[] = $row;
            }
        }

    //CLIENTEN
        $sql = "SELECT voornaam, achternaam, geboortedatum, telefoon, email, adres, plaats
                FROM `clienten` 
                WHERE id = '$client_id'
            ";
        $res = mysqli_query($con, $sql);   
        if($res) {
            while($row = mysqli_fetch_assoc($res)) {
            $client[] = $row;
            }
        }
    //
}


$json = array(
    "succes"=>true,
    "data"=>array(
        "aandoeningen"=>$aandoeningen,
        // "afspraken"=>$afspraken,
        "allergien"=>$allergien,
        "behandelplan"=>$behandelplan,
        "contactpersonen"=>$contactpersonen,
        "hulpmiddelen"=>$hulpmiddelen,
        "medicatie"=>$medicatie,
        "client"=>$client,
    ),
);





 












?>








