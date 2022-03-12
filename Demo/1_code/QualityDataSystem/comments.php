<?php
session_start();

	include("connection.php");
	include("functions.php");


?>
<!DOCTYPE html>
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
                <a href="Dashboard.php">Dashboard</a></header> 
            <center><div><form method="post" action="phpCreateComment.php">
                    <label for="txtComment">Comment:</label><br>
                    <input id='txtComment' type='text' name='comment' required>
                    <input type="submit" value="Submit">
                </form>
             <?php
            displayAllComments($con);
            ?>
                </div></center>
    </body>
</html>
