<?php

$request_body = file_get_contents('php://input');
$data = json_decode($request_body, true);

$id = null;
$commentaar = null;
$casus_id = null;

if (isset($data['id'])) {
    $id = $data['id'];
};

if (isset($data['commentaar'])) {
    $commentaar = $data['commentaar'];
};

if (isset($data['casus_id'])) {
    $casus_id = $data['casus_id'];
};


$sql = "UPDATE answers
        SET commentaar='$commentaar' 
        WHERE id = '$id'
    ";

if (mysqli_query($con, $sql)) {

    //UPDATE STATUS TO 4
    $status = null;

    $sql = 
        "SELECT status
        FROM `casus` 
        WHERE id = '$casus_id'
    ";
    $res = mysqli_query($con, $sql);   
    if($res) {
        while($row = mysqli_fetch_assoc($res)) {
            $status = $row['status'];
        }
    }

    if ($status < 4) {

        $sql = 
            "UPDATE casus
            SET status = 4 
            WHERE id = '$casus_id'
        ";
        mysqli_query($con, $sql);
    }



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