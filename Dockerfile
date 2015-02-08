# Docker container for lmh
# (c) The KWARC Group 2015

FROM debian:stable

MAINTAINER Tom Wiesing <tkw01536@gmail.com>

#
# Install all the packages
# This might take a while
#

RUN apt-get update && apt-get install -y python python-dev python-pip git subversion texlive cpanminus libxml2-dev libxslt-dev libgdbm-dev openjdk-7-jre-headless && apt-get clean

#
# Install lmh itself
#
RUN git clone https://github.com/KWARC/localmh $HOME/localmh; pip install beautifulsoup4 psutil pyapi-gitlab; ln -s $HOME/localmh/bin/lmh /usr/local/bin/lmh

#
# And run the tail command, to do nothing
#
CMD tail -f /dev/null
