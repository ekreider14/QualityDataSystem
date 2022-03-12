<script src="https://d3js.org/d3.v6.min.js"></script>

<?php

function check_login($con)
{

	if(isset($_SESSION['user_id']))
	{

		$id = $_SESSION['user_id'];
		$query = "SELECT * FROM `view_userinfo` where UserName = '$id' limit 1";

		$result = mysqli_query($con,$query);
		if($result && mysqli_num_rows($result) > 0)
		{

			$user_data = mysqli_fetch_assoc($result);
			return $user_data;
		}
	}

	//redirect to login
	header("Location: login.php");
	die;

}

function displayQualAssuranceDashboard($con)
{
    $query = "SELECT * FROM `view_mostrecentrecords`";
    $result = mysqli_query($con,$query);
    
    echo("<center><table id='sensorsTable' style='border: 1px solid black;><tr><th colspan='4'>"
            . "<h1>Current Sensor Records</h1></th></tr>"
            . "<tr><th>Sensor</th><th>Humidity</th><th>Temperature"
            . "</th><th>Last Record</th></tr>");
    while($row = mysqli_fetch_array($result)){
        echo("<tr><td style='border: 1px solid black;'>" . $row['SensorName'] . 
                "</td><td style='border: 1px solid black;'>" . $row['humidity'] .
                "</td><td style='border: 1px solid black;'>" . 
                $row['temperature'] . "</td><td style='border: 1px solid black;'>" . 
                $row['DateTimeStamp'] . "</td></tr>");
    }
}

function displayQualManagementDashboard($con)
{
    $query = "SELECT * FROM `view_trenddata`";
    $result = mysqli_query($con,$query);
    
    echo("<center><table id='trendTable' style='border: 1px solid black; width:100%;'><tr><th colspan='7'>"
            . "<h1>Trend Data</h1></th></tr>"
            . "<tr><th>Name</th><th>Avg Temp</th><th>Avg Humidity</th><th>Max Temp</th><th>Min Temp</th>"
            . "<th>Max Humidity</th><th>Min Humidity</th></tr>");
    while($row = mysqli_fetch_array($result)){
        echo("<tr><td style='border: 1px solid black;'>" . $row['SensorName'] . 
                "</td><td style='border: 1px solid black;'>" . $row['avg_temperature'] .
                "</td><td style='border: 1px solid black;'>" . 
                $row['avg_humidity'] . "</td><td style='border: 1px solid black;'>" . $row['max_temperature'] . 
                "</td><td style='border: 1px solid black;'>" . $row['min_temperature'] .
                "</td><td style='border: 1px solid black;'>" . 
                $row['max_humidity'] .  "</td><td style='border: 1px solid black;'>" . $row['min_humidity'] . "</td></tr>");
    }
}

function displayAppSupportDashboard()
{
    echo("
            <center><h1>Change User's Password</h1></center>
            <div>
                <form id='formPasswordChange' method='post' action='phpOtherPassword.php'>
                            <div style='font-size: 20px;margin: 10px;color: white;'>Enter a new password: </div>
                            <label>Username: </label><input id='txtUser' type='text' name='user_id'>
                            <label>Password: </label><input id='txtPassword' type='password' name='changedPassword'><br><br>
                            <center><input id='button' type='submit' value='Change'></center><br><br>
                    </form>
            </div>");
}

function displayITAdminDashboard()
{
    echo "ITAdminDashboard";
}

function displayAllComments($con)
{
    $query = "SELECT * FROM `webcomments`";
    $result = mysqli_query($con,$query);
    
    echo("<center><table id='commentsTable' style='border: 1px solid black; width:100%; float:left;'><tr><th colspan='3'>"
            . "<h1>Comments</h1></th></tr>"
            . "<tr><th style='width:15%'>User</th><th style='width:70%'>Comment</th><th style='width:15%'>Time"
            . "</th></tr>");
    while($row = mysqli_fetch_array($result)){
        echo("<tr><td style='border: 1px solid black;'>" . $row['UserName'] . 
                "</td><td style='border: 1px solid black;'>" . $row['Comment'] .
                "</td><td style='border: 1px solid black;'>" . 
                $row['DateTime'] . "</td></tr>");
    }
}

