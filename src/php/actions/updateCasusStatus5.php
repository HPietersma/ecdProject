<?php

$request_body = file_get_contents('php://input');
$data = json_decode($request_body, true);

$casus_id = null;

if (isset($data['casus_id'])) {
    $casus_id = $data['casus_id'];
};





//UPDATE STATUS TO 5

if (isset($data)) {



    $sql = 
        "UPDATE casus
        SET status = 5 
        WHERE id = '$casus_id'
    ";
    mysqli_query($con, $sql);



    $json = array(
        "meta"=>array (
            "succes"=>true,
            "message"=>"Casus goedgekeurd",
        ),
        "data"=>"niks",
    );

}


























?>