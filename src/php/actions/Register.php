<?php
        $request_body = file_get_contents('php://input');
    
        $data = json_decode($request_body, true);
        
        $username = "";
        $email = "";
        $password = "";
      
        if(isset($data['username'])) {
            $username = $data['username'];
            if(isset($data['email'])) {
                $email = $data['email'];
                if(isset($data['password'])) {
                    $password = $data['password'];
                };
            };
        };
     
       $token = bin2hex(random_bytes(20));
     
       $sql = "INSERT INTO users (username, email, password, token) VALUES ('".$username."', '".$email."', '".$password."', '".$token."' )";     
       $res = mysqli_query($con, $sql);  
        
          return;
      $json = array(
            "succes"=>true,
            "data"=>array(
                "username"=>$username,
                "email"=>$email,
                "user_id"=>$userID,
                "token"=>$token
            ),
        );
    
        echo json_encode($json);



?>