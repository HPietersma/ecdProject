<?php

$request_body = file_get_contents('php://input');
$data = json_decode($request_body, true);

$casus_id = null;
$answer = null;
$supervisor = null;

if (isset($data['casusAnswer']['casus_id'])) {
    $casus_id = $data['casusAnswer']['casus_id'];
};

if (isset($data['casusAnswer']['answer'])) {
    $answer = $data['casusAnswer']['answer'];
};

if (isset($data['casusAnswer']['supervisor'])) {
    $supervisor = $data['casusAnswer']['supervisor'];
};


if (isset($data)) {
   $sql = "INSERT INTO answers (casus_id, answer, supervisor)
        VALUES ('$casus_id', '$answer', '$supervisor')
    ";
    mysqli_query($con, $sql);   

    //UPDATE STATUS TO 3
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

    if ($status < 3) {

        $sql = 
            "UPDATE casus
            SET status = 3 
            WHERE id = '$casus_id'
        ";
        mysqli_query($con, $sql);
    }
}



 
 
$json = array(
    "meta"=>array (
        "succes"=>true,
        "message"=>"opgeslagen."
    ),
    "data"=>$data,
);






?>
