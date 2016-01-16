#!/bin/bash

SRCDIR=/vagrant/download
TARGETDIR=/opt
VAGRANT_USER=vagrant
SHELLFILE=/home/$VAGRANT_USER/.shell

cd $TARGETDIR 

#Java 8 
if [ ! -d $TARGETDIR/jdk1.8.0_45 ]; then
	FILENAME=jdk-8u45-linux-x64.tar.gz
	if [ ! -f $SRCDIR/$FILENAME ]; then
		wget -q -P $SRCDIR --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.tar.gz"
	fi
	cp $SRCDIR/$FILENAME .
	tar -xzvf $FILENAME
	rm -rf $FILENAME
fi

#Maven 3.3
if [ ! -d $TARGETDIR/apache-maven-3.3.3 ]; then
	FILENAME=apache-maven-3.3.3-bin.tar.gz
	if [ ! -f $SRCDIR/$FILENAME ]; then
		wget -q -P $SRCDIR http://mirror.nbtelecom.com.br/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz
	fi
	cp $SRCDIR/$FILENAME .
	tar -xzvf $FILENAME
	rm -rf $FILENAME
fi

#Groovy 2.4
if [ ! -d $TARGETDIR/groovy-2.4.3 ]; then
	FILENAME=groovy-binary-2.4.3.zip
	if [ ! -f $SRCDIR/$FILENAME ]; then
		wget -q -P $SRCDIR http://dl.bintray.com/groovy/maven/groovy-binary-2.4.3.zip
	fi
	cp $SRCDIR/$FILENAME .
	unzip $FILENAME -d $TARGETDIR
	rm -rf $FILENAME
fi

#Gradle 2.4
if [ ! -d $TARGETDIR/gradle-2.4 ]; then
	FILENAME=gradle-2.4-bin.zip
	if [ ! -f $SRCDIR/$FILENAME ]; then
		wget -q -P $SRCDIR https://services.gradle.org/distributions/gradle-2.4-bin.zip
	fi
	cp $SRCDIR/$FILENAME .
	unzip $FILENAME -d $TARGETDIR
	rm -rf $FILENAME
fi

#Tomcat 7
if [ ! -d $TARGETDIR/apache-tomcat-7.0.67 ]; then
	FILENAME=apache-tomcat-7.0.67.tar.gz
	if [ ! -f $SRCDIR/$FILENAME ]; then
		wget -q -P $SRCDIR http://apache.communilink.net/tomcat/tomcat-7/v7.0.67/bin/apache-tomcat-7.0.67.tar.gz
	fi
	cp $SRCDIR/$FILENAME .
	tar -xzvf $FILENAME
	rm -rf $FILENAME
fi

#Eclipse
if [ ! -d $TARGETDIR/eclipse-jee-mars-1-linux-gtk-x86_64 ]; then
	VERSION=jee-mars-1-linux-gtk-x86_64
	FILENAME=eclipse-$VERSION.tar.gz
	if [ ! -f $SRCDIR/$FILENAME ]; then
		wget -q -P $SRCDIR http://ftp.yz.yamagata-u.ac.jp/pub/eclipse//technology/epp/downloads/release/mars/1/eclipse-jee-mars-1-linux-gtk-x86_64.tar.gz
	fi
	cp $SRCDIR/$FILENAME .
	tar -xzvf $FILENAME
	mv eclipse eclipse-$VERSION
	ln -sf eclipse-$VERSION eclipse
	rm -rf $FILENAME
fi


SETENV=$TARGETDIR/apache-tomcat-7.0.67/bin/setenv.sh
cat <<EOF > $SETENV
export JAVA_HOME=$TARGETDIR/jdk1.8.0_45
export CATALINA_HOME=$TARGETDIR/apache-tomcat-7.0.67
EOF
chmod +x $SETENV


cat <<EOF >> $SHELLFILE
export JAVA_HOME=$TARGETDIR/jdk1.8.0_45
export JRE_HOME=$TARGETDIR/jdk1.8.0_45/jre
export M2_HOME=$TARGETDIR/apache-maven-3.3.3
export GROOVY_HOME=$TARGETDIR/groovy-2.4.3
export GRADLE_HOME=$TARGETDIR/gradle-2.4
export PATH=\$PATH:\$JAVA_HOME/bin:\$JRE_HOME/bin:\$M2_HOME/bin:\$GROOVY_HOME/bin:\$GRADLE_HOME/bin
EOF

source $SHELLFILE
ln -sf $JAVA_HOME/jre/bin/java /usr/bin/java

