<?php
	$con=mysqli_connect("127.0.0.1","root","random","student");

	print "<html><body bgcolor=\"pink\">
				<table>";

					
	if(mysqli_connect_errno($conn))
	{
		
		echo "total flop";
	}
	else
	{
		$sql="INSERT INTO student_details VALUES
('$_POST[rno]','$_POST[name]','$_POST[branch]','$_POST[batch]','$_POST[address]','$_POST[email]')";
		if (!mysqli_query($con,$sql))
  		{
  			die('Error: ' . mysqli_error($con));
  		}
		echo "1 record added";

		mysqli_close($con);
	}
	print"</html></body>";
?> 

