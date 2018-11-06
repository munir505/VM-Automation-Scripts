#!/bin/bash
wget http://download.sonatype.com/nexus/3/latest-unix.tar.gz
sudo tar xvf latest-unix.tar.gz -C /opt
sudo ln -s /opt/nexus-3.14.0-04/ /opt/nexus
sudo useradd nexus
sudo chown -R nexus:nexus /opt/nexus
sudo echo 'run_as_user="nexus"' >  /opt/nexus/bin/nexus.rc
sudo ln -s /opt/nexus/bin/nexus /etc/init.d/nexus
sudo systemctl enable nexus
sudo service nexus start
