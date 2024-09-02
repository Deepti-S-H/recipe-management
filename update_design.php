
<?php
include("connection.php");
error_reporting(0);

if(isset($_GET["rid"]))
$recipe_id=$_GET['rid'];

if(isset($_POST['update'])){
    $rid = $_POST['rid'];
	$rname = $_POST['rname'];
	$prep_time = $_POST['prep_time'];
	$description = $_POST['description'];
	$serving_with = $_POST['serving_with'];
	#echo "prep_time";
    $sql = "UPDATE recipe SET prep_time='$prep_time', description='$description', serving_with ='$serving_with' WHERE rid = '$recipe_id'";
    $result = $conn->query($sql);

 if($result == true){
    echo "<script>alert('Record updated successfully !'); location.href='show.php'; </script>";
 }
 else{
    echo 'error:'.$sql. '<br>' .$conn->error;
 }
}

if(isset($_GET['rid'])){
    $sql = "SELECT  * from recipe where rid = '$recipe_id' ";
    $result = $conn->query($sql);


    if($result->num_rows>0){
    while($row = $result->fetch_assoc()){
        $rid = $row['rid'];
        $rname = $row['rname'];
        $prep_time = $row['prep_time'];
        $description = $row['description'];
        $serving_with = $row['serving_with'];
		
       
    }
    ?>
<html>
	<head>
	<style>
		body{
			background-image:url("i1.jpeg");
			background-repeat: no-repeat;
			background-size: 100% 100%;
		}
		</style>
	</head>
	<body>


	   
	   <form action="" method="POST">
	 <table border="1" align="center">
		 <tr>
			 <td>
			 <label>Recipe id</label></td>
			 <td><input type="text"  style="width:300px;" name="rid"  value=<?php echo $recipe_id ?>></td>
		 </tr>
		 <tr>
			 <td>
			 <label>Recipe name</label></td>
			 <td><input type="text"  style="width:300px;" name="rname" value="<?php echo $rname ?>" ></td>
		 </tr>
		 <tr>
			 <td>
			 <label>preparation time</label></td>
			 <td><input type="text"   style="width:300px;" name="prep_time" value="<?php echo $prep_time ?>"></td>
		 </tr>
		 <tr>
			 <td>
			 <label>Description</label></td>
			 <td><input type="text"  style="width:300px; height:50px;" name="description" value="<?php echo $description ?>"></td>
		 </tr>
		 <tr>
			 <td>
			 <label> Serving with</label></td>
			 <td><input type="text"   style="width:300px;" name="serving_with" value="<?php echo $serving_with?>"></td>
		 </tr>
		
 
		 <tr>
			 <td colspan="2" align="center" ><input type="submit" name="update" value="Submit" style="font-size:20px"></td>
		 </tr>
	 </table>
 </form>
	</body>
 </html>
<?php

}
else{
    header('Location: show.php');
}
}
?>