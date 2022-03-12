<html>
    <head>
        <meta charset="UTF-8">
        <title>Quality Dashboard</title>
        <link id="style" rel="stylesheet" type="text/css" href="css/QualityCSS.css">
    </head>
    <body>
        <div class='background'>
            <header class='header'><a href="logout.php">Log Out</a>
                <a href="comments.php">Comments</a>
                <a href="Dashboard.php">Dashboard</a></header>
            <center><h1>Update your Password</h1></center>
            <div>
                <form id="formPasswordChange" method="post" action="phpUpdatePassword.php">
                            <div style="font-size: 20px;margin: 10px;color: white;">Enter a new password: </div>
                            <input id="text" type="password" name="changedPassword"><br><br>
                            <center><input id="button" type="submit" value="Change"></center><br><br>
                    </form>
            </div>
        </div>
    </body>
</html>

