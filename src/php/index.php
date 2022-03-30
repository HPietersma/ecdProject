<?php
$db = parse_ini_file("config.ini");

error_reporting(E_ALL & ~E_NOTICE);     
header('Access-Control-Allow-Origin: *'); 
header('Content-Type: application/json');  
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Access-Control-Allow-Methods: GET, POST, PUT');

$con = mysqli_connect($db['host'], $db['username'], $db['password'], $db['db_name']);

if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}

$json = array(
    "Message"=>"no data",
    "success"=>false,
    "data"=>null
);

include "actions/login.php";




echo json_encode($json);





if( $_GET["action"] == "test" ) {

    $json = array(
        "succes"=>false,
        "data"=>null
    );

    $sql = "SELECT *
            FROM `users` 
    ";

    $res = mysqli_query($con, $sql);   

    if ($res) {
        $lst[] = array();
        while($row = mysqli_fetch_assoc($res)) {
            $lst = $row;
        }
        $json = array(
            "succes"=>true,
            "data"=>$lst,
        );
    }

    echo json_encode($json);
}





?>