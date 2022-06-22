<?php

$request_body = file_get_contents('php://input');
$data = json_decode($request_body, true);

$id = null;
$commentaar = null;

if (isset($data['id'])) {
    $id = $data['id'];
};

if (isset($data['commentaar'])) {
    $commentaar = $data['commentaar'];
};


$sql = "UPDATE answers
        SET commentaar='$commentaar' 
        WHERE id = '$id'
    ";

if (mysqli_query($con, $sql)) {
    $json = array(
        "meta"=>array (
            "succes"=>true,
            "message"=>"Commentaar aangemaakt",
        ),
        "data"=>$data,
    );
}   
else {
    $json = array(
        "meta"=>array (
            "succes"=>false,
            "message"=>"Mislukt"
        ),
    );
}


























?>