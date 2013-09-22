#!/usr/bin/perl
use JSON;
use LWP::Simple;
mkdir "album";
get($au = shift) =~ m/^\s+trackinfo : (.+),$/m;
$dat = from_json($1);
$bc = ($au =~ s#/album/.+?$##r);
for (@$dat)
{
	$_->{title} =~ s/'/'"'"'/g;
	$_->{title} =~ s#/#__SLASH__#;
	$_->{track_num} =~ s/^(\d)$/0\1/;
	system("wget '$_->{file}->{'mp3-128'}' -O 'album/$_->{track_num} $_->{title}.mp3'") == 0 or exit 1;
	get("$bc$_->{title_link}") =~ /<link rel="image_src" href="([^"]+)">/;
	system("wget '$1' -O 'album/$_->{track_num} $_->{title}.jpg'") == 0 or exit 1;
}
system "clear";

