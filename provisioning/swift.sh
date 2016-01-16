#!/bin/bash

SRCDIR=/vagrant/download
TARGETDIR=/opt
VAGRANT_USER=vagrant
SHELLFILE=/home/$VAGRANT_USER/.shell

cd $TARGETDIR
if [ ! -d $TARGETDIR/swift ]; then
	VERSION=2.2-SNAPSHOT-2016-01-06-a
	PLATFORM=ubuntu14.04
	FILENAME=swift-$VERSION-$PLATFORM.tar.gz
	if [ ! -f $SRCDIR/$FILENAME ]; then
		URL=https://swift.org/builds/ubuntu1404/swift-$VERSION/$FILENAME
		wget -q -P $SRCDIR $URL
	fi
	cp $SRCDIR/$FILENAME .
	tar zxf $FILENAME
	ln -sf swift-$VERSION-$PLATFORM swift
	chmod 644 $TARGETDIR/swift/usr/lib/swift/CoreFoundation/*
		sudo apt-get -y install clang libicu-dev
	rm -rf $FILENAME
fi

cat <<EOF >> $SHELLFILE
export PATH=\$PATH:/opt/swift/usr/bin
EOF

source $SHELLFILE

