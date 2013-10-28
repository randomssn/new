#!/usr/bin/perl -- 
#the above line is necessary. Do not forget.

use warnings;

use CGI ':standard'; 
use DBI;
print header;

#to use POST parameters
use CGI qw();
my $params = CGI->new;

#fos mySQL connection
my $driver = "mysql"; 
my $database = "blog";
my $dsn = "DBI:$driver:database=$database";
my $userid = "root";
my $password = "random";

my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;

#check if POST parameters are defined and if so, insert into the database
if ('POST' eq $params->request_method && $params->param('name') && $params->param('comment')) 
{
    my $sth = $dbh->prepare("insert into entries values('".$params->param('name')."','".$params->param('comment')."')");
	$sth->execute() or die $DBI::errstr;
	$sth->finish();
} 

print "<html>
  <head><title>pointless blog!</title></head>
  <body>
	put the blog text here<br/>";

#retrieve all values from the database and display 
my $posts=$dbh->prepare("select * from entries");
$posts->execute() or die $DBI::errstr;
while (my @row = $posts->fetchrow_array())
{
   my ($name, $comment ) = @row;
   print "<b>".$name."</b><br/>".$comment."<br/>";
}

print "<b> Leave a comment..</b><br/>";
print "<form  method=\"POST\">
			<b>Name:</b><br/>
			<input type=\"text\" name=\"name\"/><br/>
			<b>Comment:</b><br/>		
			<textarea name=\"comment\">
			</textarea>
			<br/>
			<input type=\"submit\" name=\"submit\">
		</form>";

print"
  </body>
</html>";

$posts->finish();

 



