#!/usr/bin/env bash
CURRENT_YEAR=$(date +%Y)
SQLITE_VERSION=3460000
FILE_NAME=sqlite-autoconf-$SQLITE_VERSION
FULL_FILE_NAME=$FILE_NAME.tar.gz
DOWNLOAD_URL=https://www.sqlite.org/$CURRENT_YEAR/$FULL_FILE_NAME
wget $DOWNLOAD_URL
tar xzf $FULL_FILE_NAME
cd $FILE_NAME
./configure
make
sudo make install
