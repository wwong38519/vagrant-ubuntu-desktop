#!/bin/bash
sudo echo 'Asia/Hong_Kong' > /etc/timezone
sudo rm /etc/localtime && sudo ln -s /usr/share/zoneinfo/Asia/Hong_Kong /etc/localtime
sudo dpkg-reconfigure --frontend noninteractive tzdata
