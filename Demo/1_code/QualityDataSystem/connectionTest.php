<?php

$dbhost = "localhost";
$dbuser = "WebUser";
$dbpass = "WebUser";
$dbname = "TempData";

exec("ping -c 4" . $dbhost, $output, $result);
print_r($output);
if ($result == 0)
	echo "Ping successful!<br>";
else
	echo "Ping unsuccessful!<br>";

echo('Connecting with account ' . $dbuser . '<br>');

if ($con = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname))
{
	die("Connection succeeded!");
}

if(!$con = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname))
{
	die("failed to connect!");
}