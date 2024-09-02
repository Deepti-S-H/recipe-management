<?php include("connection.php"); ?>
<html>
<head>
	<title>
		cooking recipe management
	</title>
	<style>
		body{
			background-image:url("i1.jpeg");
			background-repeat: no-repeat;
			background-size: 100% 100%;
		}
		</style>
</head>
<body >
	<div align="center">
		<!--<h1>Details Entry Form</h1>-->
	</div>
<form action="" method="post" >
	<table border="1" align="center"  >
		<tr>
			<td>
			<label>Recipe id</label></td>
			<td><input type="text" name="rid" style="width:300px;"></td>
		</tr>
		<tr>
			<td>
			<label>Recipe name</label></td>
			<td><input type="text" name="rname" style="width:300px;"></td>
		</tr>
		<tr>
			<td>
			<label>preparation time</label></td>
			<td><input type="text" name="prep_time" style="width:300px;"></td>
		</tr>
		<tr>
			<td>
			<label>Description</label></td>
			<td ><input type="text" style="width:300px; height: 50px;" name="description"></td>
		</tr>
		<tr>
			<td>
			<label> serving with</label></td>
			<td><input type="text" name="serving_with" style="width:300px;"></td>
		</tr>
		<tr>
			<td>
			<label>calorie</label></td>
			<td><input type="text" name="calorie" style="width:300px;"></td>
		</tr>
		<tr>
			<td>
			<label>Benefit</label></td>
			<td><input type="text" name="benefits" style="width:300px;"></td>
		</tr>
		<tr>
			<td colspan="2" align="center" ><input type="submit" name="save" value="Submit" style="font-size:20px"></td>
		</tr>
	</table>
</form>
</body>
</html>

<?php

if(isset($_POST['save']))
{	
	 $rid = $_POST['rid'];
	 $rname = $_POST['rname'];
	 $prep_time = $_POST['prep_time'];
	 $description = $_POST['description'];
	 $serving_with = $_POST['serving_with'];
	 $calorie = $_POST['calorie'];
	 $benefits = $_POST['benefits'];

	 $sql_query = "INSERT INTO recipe (rid,rname,prep_time,description,serving_with)
	 VALUES ('$rid','$rname','$prep_time','$description','$serving_with')";

	 if (mysqli_query($conn, $sql_query)) 
	 {
		//echo "New Details Entry inserted successfully !";

		echo "<script>alert('New Details Entry inserted successfully !'); location.href='show.php'; </script>";
	 } 
	 else
     {
		echo "Error: " . $sql . "" . mysqli_error($conn);
	 }

	 $sql_query = "INSERT INTO benefit (rid,rname,calorie,benefits)
	 VALUES ('$rid','$rname','$calorie','$benefits')";

	 if (mysqli_query($conn, $sql_query)) 
	 {
		echo "New Details Entry inserted successfully !";
	 } 
	 else
     {
		echo "Error: " . $sql . "" . mysqli_error($conn);
	 }

	 $conn->close();
	 
	 
	 
	 
	}
?>