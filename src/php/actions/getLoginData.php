<?php

    //$_SESSION["logged_in"] = "alsdjflksd";

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

?>