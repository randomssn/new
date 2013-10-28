############################################################### 
# perl program
#a.find the list of all .txt files
#b. in that files find the line which has exactly 3 words in that #words find if there is any word starts & ends with 'E' if so count it #and print the count values

############################################################### 


#!/usr/bin/perl -w

opendir(DIR, ".");
@files = grep(/\.txt$/,readdir(DIR));
closedir(DIR);

# print all the filenames in our array
foreach $file (@files) {
   print "$file\n";
  open(FILE, $file) or die "Error: no file found.";
$output = do {local $/; <FILE> };
	if($output=~m/\w+\s+\w+\s+\w+/)
		{
			print "Three words exactly in ".$file."\n";
			@stringlist=split(/\s/,$output);
			
		}
	foreach $str(@stringlist)
	{
	#print "$str"."Here";
	if($str=~m/^e/)
		{
		if($str=~m/e$/)
		{
		print "Starting and ending in e\t".$str."\n";
		}}
}
}

#Executing the program , in terminal give perl file_listing.pl
#Ensure that the test files test1.txt and test2.txt are in same directory ,you should get the word as "eve" which starts and ends in e

