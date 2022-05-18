<?php


$request_body = file_get_contents('php://input');
$data = json_decode($request_body, true);


$casus_id;
$casusAnswers = null;


if (isset($data['casus_id'])) {
    $casus_id = $data['casus_id'];

    $sql = "SELECT answer
            FROM `answers` 
            WHERE casus_id = '$casus_id'
        ";
    $res = mysqli_query($con, $sql);   
    if($res) {
        while($row = mysqli_fetch_assoc($res)) {
            $casusAnswers[] = $row;
        }
    }
};

$json = array(
    "succes"=>true,
    "data"=>$casusAnswers
);








?>