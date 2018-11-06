#!/bin/bash
git clone https://github.com/munir505/Go-Http-Server
sudo yum install -y zip
sudo yum install -y unzip
zip -r ~/go-server.zip ~/Go-Http-Server/go

sudo useradd munir_server
sudo cp ~/go-server.zip /home/munir_server/

