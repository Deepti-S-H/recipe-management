<?php include("connection.php"); ?>
<html>
<head>
	<title>
		A Sample Tutorial for database connection.
	</title>
</head>
<body bgcolor="#32e692">
	<div align="center">
		
		<tr>
			<td colspan="2" align="center" ><input type="submit" name="save" value="Submit" style="font-size:20px"></td>
		</tr><h1>Update</h1>
	</div>
<form action="d.php" method="post">
	<table border="1" align="center">
		<tr>
			<td>
			<label>Enter id</label></td>
			<td><input type="text" name="rid"></td>
		</tr>
		<tr>
			<td>
			<label>Enter name</label></td>
			<td><input type="text" name="rname"></td>
		</tr>
		<tr>
			<td>
			<label>pre</label></td>
			<td><input type="text" name="prep_time"></td>
		</tr>
		<tr>
			<td>
			<label>Enter des</label></td>
			<td><input type="text" name="description"></td>
		</tr>
		<tr>
			<td>
			<label>Enter servinf</label></td>
			<td><input type="text" name="serving_with"></td>
		</tr>
		<tr>
			<td>
			<label>Enter calorie</label></td>
			<td><input type="text" name="calorie"></td>
		</tr>
		<tr>
			<td>
			<label>Enter benefit</label></td>
			<td><input type="text" name="benefit"></td>
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
	 $benefit = $_POST['benefit'];

	 $sql_query = "INSERT INTO recipe (rid,rname,prep_time,description,serving_with)
	 VALUES ('$rid','$rname','$prep_time','$description','$serving_with')";

	 if (mysqli_query($conn, $sql_query)) 
	 {
		echo "New Details Entry inserted successfully !";
	 } 
	 else
     {
		echo "Error: " . $sql . "" . mysqli_error($conn);
	 }

	 $sql_query = "INSERT INTO benefit (rid,rname,calorie,benefit)
	 VALUES ('$rid','$rname','$calorie','$benefit')";

	 if (mysqli_query($conn, $sql_query)) 
	 {
		echo "New Details Entry inserted successfully !";
	 } 
	 else
     {
		echo "Error: " . $sql . "" . mysqli_error($conn);
	 }
	 
	 
	 
	 
	}
?>