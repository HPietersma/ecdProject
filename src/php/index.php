<?php
// ini_set('session.cookie_secure', "1"); 
// ini_set('session.cookie_httponly', "1"); 
// ini_set('session.cookie_samesite','None');

session_start();

$db = parse_ini_file("config.ini");

error_reporting(E_ALL & ~E_NOTICE);     
header('Access-Control-Allow-Origin: http://localhost:8080'); 
header("Access-Control-Allow-Credentials: true");
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

$action = "no_action_set";
if (isset($_GET["action"])) {
    $action = $_GET["action"];
}

include "actions/" . $action . ".php";

echo json_encode($json);




?>