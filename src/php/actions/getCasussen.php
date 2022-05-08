<?php

$user_id = $_SESSION["user_id"];
$casussen = null;

$sql = 
    "SELECT *
    FROM `casus` 
    WHERE user_id = '$user_id'"
;
$res = mysqli_query($con, $sql);   
if($res) {
    while($row = mysqli_fetch_assoc($res)) {
        $casussen[] = $row;
    }
}

$json = array(
    "succes"=>true,
    "data"=>$casussen,
);







?>