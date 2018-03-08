#!/bin/bash

Version="1.16.1"
# Docker-compose install
curl -L https://github.com/docker/compose/releases/download/$Version/docker-compose-`uname -s`-`uname -m` > ./docker-compose
chmod +x docker-compose
sudo mv docker-compose /usr/bin/docker-compose

## Get the dcs from docker
curl -sL bit.ly/ralf_dcs -o ./dcs
sudo chmod 755 ./dcs
sudo mv ./dcs /usr/bin/dcs
