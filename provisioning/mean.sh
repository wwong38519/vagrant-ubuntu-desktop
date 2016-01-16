#!/bin/bash

#apt-get update
apt-get install -y python-dev python-pip

# mongodb
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
apt-get update
apt-get install -y mongodb-org
mkdir -p /data/db
chown -R mongodb:mongodb /data/db
service mongod start

# nodejs
apt-get install -y node
apt-get install -y npm
