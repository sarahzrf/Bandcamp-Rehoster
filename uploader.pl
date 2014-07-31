#!/usr/bin/perl
$au = shift;
$au =~ s/'/'"'"'/g;
$user = shift;
$user =~ s/'/'"'"'/g;
$pass = shift;
$pass =~ s/'/'"'"'/g;

chdir "mp4s";
for (<*.mp4>)
{
	$title = s/.mp4$//r;
	$title =~ s#__SLASH__#/#;
	$title =~ s/'/'"'"'/g;
	system("../youtube_upload.py --email='$user' --password='$pass' " .
		"--title='$title' --description='$au' --category='Music' " .
		"--keywords='$title' '$_'") == 0 or exit 1;
	print "Sleeping five minutes for processing reasons...\n";
	sleep 60 * 5;
}
system "clear";

