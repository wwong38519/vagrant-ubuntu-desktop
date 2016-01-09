#!/bin/bash

#sudo apt-get install dictionaries-common
#sudo /usr/share/debconf/fix_db.pl
#sudo dpkg-reconfigure dictionaries-common

#sudo apt-get install -y xfce4 ubuntu-gnome-desktop virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
#sudo echo "allowed_users=anybody" > /etc/X11/Xwrapper.config
#startxfce4&

sudo apt-add-repository ppa:diesch/testing
sudo apt-get install -y gnome-session-fallback classicmenu-indicator
sudo apt-get install unity-tweak-tool

