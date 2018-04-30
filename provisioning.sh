#!/bin/bash
LANG=en_US.UTF-8

apt-get 2> /tmp/check_pkgmgmt
	if [[ `(grep "not" /tmp/check_pkgmgmt)` != "" ]];then
		Pkg_mgmt="yum"
	else
		Pkg_mgmt="apt-get"
		apt update
fi
sudo $Pkg_mgmt install curl -y
sudo $Pkg_mgmt install wget -y
sudo $Pkg_mgmt install vim -y
sudo $Pkg_mgmt install git -y
sudo $Pkg_mgmt install bc -y
#sudo $Pkg_mgmt update -y

# Docker stable ver. install 
sudo wget -qO- https://get.docker.com/ | CHANNEL=stable sh

# Docker-compose install
curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-`uname -s`-`uname -m` > /usr/bin/docker-compose
sudo chmod 755 /usr/bin/docker-compose
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl status docker |grep Active

## Get the dcs from docker
curl -sL bit.ly/ralf_dcs -o ./dcs
sudo chmod 755 ./dcs
sudo mv ./dcs /usr/bin/dcs
