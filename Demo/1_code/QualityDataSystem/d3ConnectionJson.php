<?php
    $username = "WebUser"; 
    $password = "WebUser";   
    $host = "localhost";
    $database="TempData";

	//connection strings
    $con = mysqli_connect($host, $username, $password);

	//query
    $query = "Select * from TempData.view_mostrecentrecords";

	//result set
    $result = mysqli_query($con, $query);

	//configure array
    $data = array();

	//add to array
    for ($x = 0; $x < mysqli_num_rows($result); $x++) {
        $data[] = mysqli_fetch_assoc($result);
    }

	//return json
    echo json_encode($data);     

?>
