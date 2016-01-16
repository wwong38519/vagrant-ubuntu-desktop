#!/bin/bash

SRCDIR=/vagrant/download
TARGETDIR=/opt
VAGRANT_USER=vagrant
SHELLFILE=/home/$VAGRANT_USER/.shell

#sudo apt-get update
sudo apt-get install -y python-dev python-pip

cd $TARGETDIR

#PyCharm
if [ ! -d $TARGETDIR/pycharm ]; then
	VERSION=community-5.0.3
	FILENAME=pycharm-$VERSION.tar.gz
	URL=https://download.jetbrains.com/python/$FILENAME
	if [ ! -f $SRCDIR/$FILENAME ]; then
		wget -q -P $SRCDIR $URL
	fi
	cp $SRCDIR/$FILENAME .
	tar -xzvf $FILENAME
	ln -sf pycharm-$VERSION pycharm
	rm -rf $FILENAME
fi

