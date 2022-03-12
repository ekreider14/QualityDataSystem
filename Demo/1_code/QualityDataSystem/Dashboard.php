<?php
session_start();

	include("connection.php");
	include("functions.php");
	
	$user_data = check_login($con);

?>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title>Quality Dashboard</title>
        <link id="style" rel="stylesheet" type="text/css" href="css/QualityCSS.css">
    </head>
    <body>
        <div class='background'>
            <header class='header'><a href="logout.php">Log Out</a>
                <a href="updatePassword.php">Change Password</a>
                <a href="comments.php">Comments</a></header>
        Hello, <?php echo $_SESSION['user_id'] . ' , ' . $_SESSION['userAccessName']; 
        echo '<br><div>';        
        switch ($_SESSION['userAccessLevel']){
            case "1":
                displayQualAssuranceDashboard($con);
                break;
            case "2":
                displayQualManagementDashboard($con);
                break;
            case "3":
                displayAppSupportDashboard();
                break;
            case "9":
                displayQualAssuranceDashboard($con);
                displayQualManagementDashboard($con);
                displayAppSupportDashboard();
                break;
            default:
                echo "I'm not sure what you are";
        }
        echo '</div>';
        ?>
        <script>
        </script>
        </div>
    </body>
</html>
