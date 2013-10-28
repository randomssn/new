<?php
$con=mysqli_connect("127.0.0.1","root","random","examples");
// Check connection
if (mysqli_connect_errno())
  {
  Print "Failed to connect to MySQL: " . mysqli_connect_error();
  }

$result = mysqli_query($con,"SELECT * FROM cars");
while($row = mysql_fetch_row($result)) {
   Print "ID:".$row[0]." Name:".$row[1] ."Year: ". //display the results
   $row[2]."<br>";
}
Print "HEREE111";
//close the connection
mysql_close($dbhandle);
?>
