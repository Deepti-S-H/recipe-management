<?php
include("connection.php");
if(isset($_GET['rid'])){
    $recipe_id=$_GET['rid'];
    $sql="DELETE from recipe WHERE rid = '$recipe_id'";
    $result = $conn->query($sql);
    if($result == true){
        echo "<script>alert('Record deleted successfully !'); location.href='show.php'; </script>";
     }
     else{
        echo 'error:'.$sql. '<br>' .$conn->error;
     }
    }

?>