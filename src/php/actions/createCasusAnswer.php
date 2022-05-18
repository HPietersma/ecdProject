<?php

$request_body = file_get_contents('php://input');
$data = json_decode($request_body, true);

$casus_id = null;
$answer = null;

if (isset($data['casusAnswer']['casus_id'])) {
    $casus_id = $data['casusAnswer']['casus_id'];
};

if (isset($data['casusAnswer']['answer'])) {
    $answer = $data['casusAnswer']['answer'];
};

if (isset($data)) {
   $sql = "INSERT INTO answers (casus_id, answer)
        VALUES ('$casus_id', '$answer')
    ";
    mysqli_query($con, $sql);   
}

 
 
$json = array(
    "meta"=>array (
        "succes"=>true,
        "message"=>"opgeslagen."
    ),
    "data"=>$data,
);






?>
