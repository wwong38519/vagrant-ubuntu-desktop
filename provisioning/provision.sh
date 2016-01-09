#!/bin/bash

sudo apt-get update
sudo apt-get install -y wget curl git unzip build-essential

chmod +x /vagrant/provisioning/*.sh
/vagrant/provisioning/timezone.sh
/vagrant/provisioning/locale.sh
/vagrant/provisioning/gui.sh
/vagrant/provisioning/ide.sh


