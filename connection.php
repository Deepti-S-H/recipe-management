<?php
//error_reporting(0);
$server_name="localhost";
$username="root";
$password="";
$database_name="cooking_recipe";

$conn=mysqli_connect($server_name,$username,$password,$database_name);
//now check the connection
if($conn)
{
	//echo "Connection ok";

}
else{
    echo "connection failed";

}
?>