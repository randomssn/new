##################################################################
#Write perl scripts for the following
#a) replace xxx in a string with spaces
#b)find strings starting and ending with letter d
#c)find strings that contain digits
#d)find strings starting with word "perl"
#e)find three word sentences separated by spaces
################################################################
#!/usr/bin/perl
@stringlist=qw(FOSSLab PerlProgramming  PerlMaster 9991d doped duped vxxxvbxxx);
$stringlist[7]="Fun With Programs";
print "Printing the stored array of strings \n";
my $str;
foreach $str(@stringlist)
{
print "$str";
print "\n";
}
print "Replacing xxx in list of strings with space\n";
foreach $str(@stringlist)
{
$str=~s/xxx/ /g;
}
foreach $str(@stringlist)
{
print $str;
print "\n";
}
print "Strings containing digits in given list of strings \n";
foreach $str(@stringlist)
{
	if($str=~m/\d+/)
		{
		print $str."\n";
		}
}
print "Strings Starting and ending with d\n";
foreach $str(@stringlist)
{
	if($str=~m/^d/)
		{
		if($str=~m/d$/)
		{
		print $str."\n";
		}}
}
print "Strings starting with Perl\n";
foreach $str(@stringlist)
{
	if($str=~m/^Perl/)
		{
			print $str."\n";
		}
}
print "Strings with three words separated by three spaces\n";
foreach $str(@stringlist)
{
	if($str=~m/\w+\s+\w+\s+\w+/)
	{
			print $str."\n";
		}
}
	


