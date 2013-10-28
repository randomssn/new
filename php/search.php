<html>
<head>
<title> SEARCH FOR A  STUDENT </title>
</head>
<body bgcolor="pink">
<form action="search.php" method="POST">
	<table>
	<tr>
	<td> Register Number:</td>
	<td> <input type="text" name="rno"> </td>
	</tr>
	<tr>
	<td><input type="submit" value="SEARCH"></td>
	</tr>
</table>
</form>
</body>
</html>
<?php
	$conn=mysqli_connect("127.0.0.1","root","random","student");

	print "<html><body bgcolor=\"pink\">
				<table>";

					
	if(mysqli_connect_errno($conn))
	{
		
		echo "total flop";
	}
	else
	{
		
		$sql="select * from student_details where register_number='$_POST[rno]'";
		$res=mysqli_query($conn,$sql);
				while($row=mysqli_fetch_array($res))
		{
			print "<tr>";
		print "<th> REGISTER NO </th> 
			<th>NAME </th><th> BRANCH </th> <th>BATCH </th><th>ADDRESS</th><th>EMAIL</th> </tr>";

			print "<tr>";
			print "<td>".$row["register_number"]."</td>"."<td>".$row["name"]. "</td>";
			print "<td>".$row["branch"]."</td>"."<td>".$row["batch"]."</td>"."<td>".$row["address"]."</td>"."<td>".$row["email"]."</td>";
			print "</tr>";
		}
		print "</table></body>
			</html>";
	}
?>

