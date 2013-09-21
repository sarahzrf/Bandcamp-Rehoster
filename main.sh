#!/bin/bash
if [[ ! "$3" ]]; then
	echo "Usage: main.sh ALBUM_URL YOUTUBE_USERNAME YOUTUBE_PASSWORD"
	exit 1
fi
if ! ./bndcmp.pl "$1"; then
	echo "Failed to download the album!"
	exit 2
fi
if ! ./combiner.pl "$1"; then
	echo "Failed to create the videos!"
	exit 3
fi
if ! ./uploader.pl "$2" "$3"; then
	echo "Failed to upload the videos!"
	exit 4
fi
echo "Done!"
echo "Be sure to remove the album and mp4s directories before reusing this tool."

