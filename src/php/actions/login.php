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
                //"token"=>$token
            ),
        );

        $_SESSION["logged_in"] = true;
        $_SESSION["username"] = $lst["username"];
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
