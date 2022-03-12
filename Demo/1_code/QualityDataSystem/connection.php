<?php

$dbhost = "localhost";
$dbuser = "WebUser";
$dbpass = "WebUser";
$dbname = "TempData";

if(!$con = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname))
{
	die("failed to connect!");
}