<html>
<head>
<title> REGISTER NEW STUDENT </title>
</head>
<body bgcolor="pink">
<form action="update.php" method="POST">
	<table>
	<tr>
	<td> Register Number:</td>
	<td> <input type="text" name="rno"> </td>
	</tr>
	<tr>
	<td>Address :</td>
	<td> <input type="textarea" name="address"> </td>
	</tr>
	<tr>
	<td> E Mail:</td>
	<td> <input type="text" name="email"> </td>
	</tr>
	<tr>
	<td><input type="submit" value="INSERT"></td>
	</tr>
</table>
</form>
</body>
</html>
<?php
	$con=mysqli_connect("127.0.0.1","root","random","student");

	print "<html><body bgcolor=\"pink\">
				<table>";

					
	if(mysqli_connect_errno($con))
	{
		
		echo "total flop";
	}
	else
	{
		$sql="update student_details set address='$_POST[address]' and email='$_POST[email]'where register_number='$_POST[rno]'";
		if (!mysqli_query($con,$sql))
  		{
  			die('Error: ' . mysqli_error($con));
  		}
		print "1 record updated";

		mysqli_close($con);
	}
	print"</html></body>";
?> 



