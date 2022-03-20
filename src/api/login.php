<?php
$db = parse_ini_file("config.ini");

session_start();
error_reporting(E_ALL & ~E_NOTICE);        // schakel notices uit (zijn niet interessant maar mollen de JSON output wel)
header('Access-Control-Allow-Origin: *');  // kan ook van andere servers dan alleen localhost benaderd worden
header('Content-Type: application/json');  // geef aan dat deze file een JSON format teruggeeft

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


    //$username = $_POST["gebruikersnaam"];
    //$password = $_POST["wachtwoord"];
    $username = $data['gebruikersnaam'];
    $password = $data['wachtwoord'];

    $sql = "SELECT *
            FROM `users` 
            WHERE   gebruikersnaam = '$username' AND
                    wachtwoord = '$password'
            ";

    $res = mysqli_query($con, $sql);   
    if($res) {

        $_SESSION['logged_in'] = true;

        while($rij = mysqli_fetch_assoc($res)) {
            $_SESSION['username'] = $rij['gebruikersnaam'];
            $_SESSION['user_id'] = $rij['id'];
        }

        $json = array(
            "data"=>"login succes"
        );
    } else {
        $json = array(
            "data"=>"inlog gegevens kloppen niet"
        );
    }
    
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
            "data"=>$lst
        );
    }

    echo json_encode($json);
}





?>