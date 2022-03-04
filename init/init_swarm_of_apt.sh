#!/bin/bash

curl -fsSL https://get.docker.com | bash -s docker

apt update && apt upgrade -y && apt install -y python3 && apt install -y python3-pip

pip3 install docker-compose

base=https://github.com/docker/machine/releases/download/v0.16.2 &&
  curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
  sudo mv /tmp/docker-machine /usr/local/bin/docker-machine &&
  chmod +x /usr/local/bin/docker-machine

docker-machine create -d virtualbox swarm-manager
docker-machine ssh swarm-manager
docker swarm init

docker info
