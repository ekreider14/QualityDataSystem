<?php
        session_start();
        
        include("connection.php");
	include("functions.php");
        
        $comment = $_POST['comment'];
        $userName = $_SESSION['user_id'];
        
        echo($userName . " " . $comment);
        $query = "insert into webcomments (UserName, Comment) values ('" . $userName . "', '" . $comment . "');";

        $result = mysqli_query($con,$query);
        
        header("Location: comments.php");
?>
