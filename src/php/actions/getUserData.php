<?php

   

if(isset($_SESSION["logged_in"])) {

    $json = array(
        "logged_in"=>$_SESSION["logged_in"],
        "username"=>$_SESSION["username"],
        "user_id"=>$_SESSION["user_id"],
        "role"=>$_SESSION["role"],
        "email"=>$_SESSION["email"] 
    );
}
else {
    $json = array(
        "logged_in"=>false,
    );
}
    

?>