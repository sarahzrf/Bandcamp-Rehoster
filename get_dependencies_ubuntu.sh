#!/bin/bash
set -e

apt-add-repository ppa:jon-severinsson/ffmpeg
apt-get update
apt-get install cpanminus python-pip imagemagick ffmpeg
cpanm LWP::Simple JSON
if which pip-2; then
	pip=pip-2
elif which pip2; then
	pip=pip2
fi
$pip install gdata progressbar

