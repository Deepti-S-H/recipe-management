<?php
include("connection.php");
//error_reporting(0);
	$sql= 'select * from recipe';
    $result = $conn->query($sql);
	
?>
<html>
    <head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
    <h2 align='center'> Recipe Table </h2>
        <table border='3' cellspacing="7">
            <tr>
            <th width="10%">Recipe Id</th>
            <th  width="10%">Recipe Name</th>
            <th  width="10%">Preparation time</th>
            <th  width="50%">Description</th>
            <th  width="10%"> Serving with </th>
            <th width="10%">Operations</th>
          
        
    </tr>
   

        
        <?php
        if($result->num_rows>0){
            while($row = $result->fetch_assoc())
        {
        ?>
            <tr>
            <td><?php echo $row['rid']; ?></td>
            <td><?php echo $row['rname']; ?></td>
            <td><?php echo $row['prep_time']; ?></td>
            <td><?php echo $row['description']; ?></td>
            <td><?php echo $row['serving_with']; ?></td>
            <td><a href="update_design.php?rid=<?php echo $row['rid'];?>"> 
            update</a><a href="delete.php?rid=<?php echo $row['rid'];?>">
            delete</a></td>
            
                  
            </tr>
        <?php
        }
    }
    ?>
     </body>
</table>
</html>

	