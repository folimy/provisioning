#!/bin/bash
LANG=en_US.UTF-8

apt-get 2> /tmp/check_pkgmgmt
	if [[ `(grep "not" /tmp/check_pkgmgmt)` != "" ]];then
		Pkg_mgmt="yum"
	else
		Pkg_mgmt="apt-get"
		apt update
fi
sudo $Pkg_mgmt install curl bc -y
#sudo $Pkg_mgmt update -y

# Docker stable ver. install 
sudo curl -sL  https://get.docker.com/ |sed -e 's/edge/stable/g' | sh


# Docker-compose install
#curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-`uname -s`-`uname -m` > /usr/bin/docker-compose
composevr=$(curl -sL https://github.com/docker/compose/releases |grep curl |head -n1 | awk -F"/" '{ print $8 }')
curl -L https://github.com/docker/compose/releases/download/$composevr/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod 755 /usr/bin/docker-compose
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl status docker |grep Active

## Get the dcs from docker
curl -sL bit.ly/ralf_dcs -o ./dcs
sudo chmod 755 ./dcs
sudo mv ./dcs /usr/bin/dcs
