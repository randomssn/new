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
		
		$sql="select * from student_details";
		$res=mysqli_query($conn,$sql);
		print "<tr>";
		print "<td> REGISTER NUMBER </td> 
			<td>NAME </td><td> BRANCH </td> <td>BATCH </td> </tr>";
		while($row=mysqli_fetch_array($res))
		{
			print "<tr>";
			print "<td>".$row["register_number"]."</td>"."<td>".$row["name"]. "</td>";
			print "<td>".$row["branch"]."</td>"."<td>".$row["batch"]."</td>";
			print "</tr>";
		}
		print "</table></body>
			</html>";
	}
?>

