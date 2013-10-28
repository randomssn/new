#!/usr/bin/perl --
use warnings;
use CGI ':standard';
use DBI;
print header;
use CGI qw();
my $flag=0;
my $params=CGI->new;

my $driver="mysql";
my $database="usersdb";
my $dsn="DBI:$driver:database=$database";
my $userid="root";
my $password="random";
my $dbh=DBI->connect($dsn,$userid,$password) or die $DBI::errstr;
my $sth=$dbh->prepare("select * from users where username=? and password=?");
if('POST' eq $params->request_method and $params->param('uname') and $params->param('pwd'))
{
	my $sth=$dbh->prepare("select * from users where username=? and password=?");
	$sth->execute($params->param('uname'),$params->param('pwd')) or die $DBI::errstr;
	$count=$sth->rows;
	if($count == 1){
		$flag=1;
		#print "Location: 127.0.0.1/cgi-bin/welcome.pl" ;
	}
}
	
print "<html>";
print "<head>";
print "<title> LOGIN </title>";
print "</head>";
print "<body bgcolor=\"pink\">";
if($flag==1)
{
	print "<b> LOGGED IN !! </b>";
}
else
{
print "<form method=\"POST\">
	<b> UserName </b> : <input type=\"text\" name=\"uname\"><br>
	<b> Password </b> : <input type=\"password\" name=\"pwd\" <br>
	<input type=\"submit\">
	</form>";
}
print "</body></html>";







