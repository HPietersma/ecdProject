<?php


$request_body = file_get_contents('php://input');
$data = json_decode($request_body, true);

if (isset($_SESSION["role"])) {
    if ($_SESSION["role"] == "Supervisor") {

        $klas_id = "";

        if (isset($data['klas_id'])) {
            $klas_id = $data['klas_id'];
        };
        
        
        $klas = array();
        
        $sql = "SELECT id, voornaam, achternaam, email
                FROM `users` 
                WHERE klas_id = '$klas_id'
            ";
        $res = mysqli_query($con, $sql);   
        if($res) {
            while($row = mysqli_fetch_assoc($res)) {
                $klas[] = $row;
            }
        }
        
        $json = array(
            "succes"=>true,
            "data"=>$klas,
        );
    }
    else {
        $json = array(
            "succes"=>false,
            "data"=>NULL,
            "error"=>" 401 - ongevoegd",
        );
    }
}
else {
    $json = array(
        "succes"=>false,
        "data"=>"401 - niet ingelogd",
    );
}







 












?>








