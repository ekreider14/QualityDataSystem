<?php
session_start();

	include("connection.php");
	include("functions.php");


	if($_SERVER['REQUEST_METHOD'] == "POST")
	{
		//something was posted
		$user_name = $_POST['user_name'];
		$password = $_POST['password'];

		if(!empty($user_name) && !empty($password) && !is_numeric($user_name))
		{

			//read from database
			$query = "SELECT * FROM `view_userinfo` where UserName = '$user_name' limit 1";
			$result = mysqli_query($con, $query);

			if($result)
			{
				if($result && mysqli_num_rows($result) > 0)
				{

					$user_data = mysqli_fetch_assoc($result);
					
					if($user_data['UserPassword'] === $password)
					{

						$_SESSION['user_id'] = $user_data['UserName'];
                                                $_SESSION['userAccessLevel'] = $user_data['AccessLevel'];
                                                $_SESSION['userAccessName'] = $user_data['AccessName'];
						header("Location: Dashboard.php");
						die;
					}
				}
			}
			
			echo "wrong username or password!";
		}else
		{
			echo "wrong username or password!";
		}
	}

?>


<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
        <link id="style" rel="stylesheet" type="text/css" href="css/QualityCSS.css">
</head>
<body>
        <div class='background'>
            <center><h1>Quality Data System</h1></center>
            <div id="box">

                    <form method="post">
                            <div style="font-size: 20px;margin: 10px;color: white;">Login</div>

                            <input id="text" type="text" name="user_name"><br><br>
                            <input id="text" type="password" name="password"><br><br>

                            <input id="button" type="submit" value="Login"><br><br>
                    </form>
            </div>
        </div>
</body>
</html>
