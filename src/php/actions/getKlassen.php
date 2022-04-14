<?php

if (isset($_SESSION["role"])) {
    if ($_SESSION["role"] == "Supervisor") {

        $sql = "SELECT *
                FROM `klassen` 
                ";

        $res = mysqli_query($con, $sql);   
        if($res) {
            $lst = array();

            while($row = mysqli_fetch_assoc($res)) {

                $lst[] = $row;

            }

            $json = array(
                "succes"=>true,
                "data"=>$lst
            );


        }
        else {
            $json = array(
                "succes"=>false,
                "data"=>null
            );
        }
    }
    else {
        $json = array(
            "succes"=>false,
            "data"=>NULL,
            "error"=>array(
                "code"=>"401",
                "message"=>"onbevoegd"
            ),
        );
    }
}
else {
    $json = array(
        "succes"=>false,
        "data"=>NULL,
        "error"=>array(
            "code"=>"401",
            "message"=>"niet ingelogd"
        ),
    );
}
 


?>
