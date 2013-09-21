#!/bin/bash
if [[ ! "$3" ]]; then
	echo "Usage: main.sh ALBUM_URL YOUTUBE_USERNAME YOUTUBE_PASSWORD"
	exit 1
fi
./bndcmp.pl "$1"
./combiner.pl "$1"
./uploader.pl "$2" "$3"

