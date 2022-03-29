<?php
$db = parse_ini_file("config.ini");

session_start();
error_reporting(E_ALL & ~E_NOTICE);        // schakel notices uit (zijn niet interessant maar mollen de JSON output wel)
header('Access-Control-Allow-Origin: *');  // kan ook van andere servers dan alleen localhost benaderd worden
header('Content-Type: application/json');  // geef aan dat deze file een JSON format teruggeeft
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Access-Control-Allow-Methods: GET, POST, PUT');

// include "db.php"; // hierin wordt de database connection geset in $con (zie voorbeeld hieronder)
// onderstaande db connectie via MySQLi kan de inhoud zijn van db.php (hier in apart bestand, want er staan wachtwoorden in)

$con = mysqli_connect($db['host'], $db['username'], $db['password'], $db['db_name']);

if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}
mysqli_query($con, "SET NAMES 'utf8'"); // om de data in de juiste charachter-set op te halen. ZONDER DEZE KAN JE JSON CORRUPT ZIJN => GEEN OUTPUT!!


// Deze API geeft in ieder geval onderstaande array in JSON terug
// Hieronder de standaard json output, zodat api altijd wat terug geeft (tenzij er fouten in de PHP zitten)



$json = array(
    "sMessage"=>"nog niets geset",
    "bSuccess"=>false,
    "data"=>null
);



if( $_GET["action"] == "login" ) {

    //session_start();

    $request_body = file_get_contents('php://input');
    $data = json_decode($request_body, true);

    $email = "";
    $password = "";

    if(isset($data['email'])) {
        $email = $data['email'];
    };
    if(isset($data['password'])) {
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
            $token = bin2hex(random_bytes(20));
            $userID = $lst["id"];

            $sqlToken = "UPDATE `users`
                        SET token = '$token'
                        WHERE id = '$userID' 
            ";

            $updateToken = mysqli_query($con, $sqlToken);   

            $json = array(
                "succes"=>true,
                "data"=>array(
                    "username"=>$lst["username"],
                    "email"=>$lst["email"],
                    "user_id"=>$lst["id"],
                    "admin"=>$lst["admin"],
                    "token"=>$token
                ),
            );
        }
        else {
            $json = array(
                "succes"=>false,
                "data"=>"inlog gegevens kloppen niet"
            );
        }
  

    } 
    else {
        $json = array(
            "succes"=>false,
            "data"=>"kan geen verbinding maken met database"
        );
    }
    echo json_encode($json);
}

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