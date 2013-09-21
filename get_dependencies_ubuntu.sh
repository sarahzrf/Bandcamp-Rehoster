#!/bin/bash
sudo apt-add-repository ppa:jon-severinsson/ffmpeg
sudo apt-get update
sudo apt-get install cpanminus python-pip imagemagick ffmpeg
sudo cpanm LWP::Simple JSON
sudo pip-2.7 install gdata progressbar

