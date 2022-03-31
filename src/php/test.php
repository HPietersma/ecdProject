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

// $action = "action_not_recognized";
// if (isset($_GET["action"])) {
//     $action = $_GET["action"];
// }

// include "actions/" . $action . ".php";

if( $_GET["action"] == "login" ) {

    $request_body = file_get_contents('php://input');
    $data = json_decode($request_body, true);

    $email = "";
    $password = "";

    if (isset($data['email'])) {
        $email = $data['email'];
    };
    if (isset($data['password'])) {
        $password = $data['password'];
    };

    $sql = "SELECT *
            FROM `users` 
            WHERE   email = '$email' AND
                    password = '$password'
            ";

    $res = mysqli_query($con, $sql);   
    if($res) {
        $lst[] = array();

        while($row = mysqli_fetch_assoc($res)) {
            $lst = $row;
        }

        if (mysqli_num_rows($res) == 1) {
            // $token = bin2hex(random_bytes(20));
            // $userID = $lst["id"];

            // $sqlToken = "UPDATE `users`
            //             SET token = '$token'
            //             WHERE id = '$userID' 
            // ";

            //$updateToken = mysqli_query($con, $sqlToken);   

            $json = array(
                "succes"=>true,
                "data"=>array(
                    "username"=>$lst["username"],
                    "email"=>$lst["email"],
                    "user_id"=>$lst["id"],
                    "admin"=>$lst["admin"],
                    //"token"=>$token
                ),
            );

            $_SESSION["logged_in"] = true;
            $_SESSION["username"] = $lst["username"];
            $_SESSION["user_id"] = $lst["id"];

        }
        else {
            $json = array(
                "succes"=>false,
                "data"=>"inlog gegevens kloppen niet"
            );
        }
    } 
}

if( $_GET["action"] == "getLoginData" ) {
   
    if(isset($_SESSION["logged_in"])) {

        $json = array(
            "logged_in"=>$_SESSION["logged_in"],
            "username"=>$_SESSION["username"],
            "user_id"=>$_SESSION["user_id"]
        );
    }
    else {
        $json = array(
            "logged_in"=>false,
        );
    }
}




echo json_encode($json);





// if( $_GET["action"] == "test" ) {

//     $json = array(
//         "succes"=>false,
//         "data"=>null
//     );

//     $sql = "SELECT *
//             FROM `users` 
//     ";

//     $res = mysqli_query($con, $sql);   

//     if ($res) {
//         $lst[] = array();
//         while($row = mysqli_fetch_assoc($res)) {
//             $lst = $row;
//         }
//         $json = array(
//             "succes"=>true,
//             "data"=>$lst,
//         );
//     }

//     echo json_encode($json);
// }





?>