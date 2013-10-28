<html>
<head>
<title> SEARCH FOR A  STUDENT </title>
</head>
<body bgcolor="pink">
<form action="delete.php" method="POST">
	<table>
	<tr>
	<td> Register Number:</td>
	<td> <input type="text" name="rno"> </td>
	</tr>
	<tr>
	<td><input type="submit" value="DELETE"></td>
	</tr>
</table>
</form>
</body>
</html>
<?php
	$con=mysqli_connect("127.0.0.1","root","random","student");

	print "<html><body bgcolor=\"pink\">
				";

					
	if(mysqli_connect_errno($con))
	{
		
		echo "total flop";
	}
	else
	{
		$sql="delete from student_details where register_number='$_POST[rno]'";
		if (!mysqli_query($con,$sql))
  		{
  			die('Error: ' . mysqli_error($con));
  		}
		echo "1 record deleted";

		mysqli_close($con);
		print "</body>
			</html>";
	}
?>

		
	
