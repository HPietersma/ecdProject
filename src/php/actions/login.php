<?php

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
    //$_SESSION['logged_in'] = true;

    while($row = mysqli_fetch_assoc($res)) {
        // $_SESSION['username'] = $rij['gebruikersnaam'];
        // $_SESSION['user_id'] = $rij['id'];
        $lst = $row;

        $role_id = $lst['role'];

        $sql2 = "SELECT role
        FROM `roles` 
        WHERE   id = '$role_id'
        ";

        $res2 = mysqli_query($con, $sql2);
        $role = "";

        if($res2) {
            while($row2 = mysqli_fetch_assoc($res2)) {
                $lst['role'] = $row2['role'];
            }
        }


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
                "email"=>$lst["email"],
                "user_id"=>$lst["id"],
                "role"=>$lst["role"],
                //"token"=>$token
            ),
        );

        $_SESSION["logged_in"] = true;
        $_SESSION["user_id"] = $lst["id"];
        $_SESSION["role"] = $lst["role"];
        $_SESSION["email"] = $lst["email"];



    }
    else {
        $json = array(
            "succes"=>false,
            "data"=>"inlog gegevens kloppen niet"
        );
    }
} 


?>
