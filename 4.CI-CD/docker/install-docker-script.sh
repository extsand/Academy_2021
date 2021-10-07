#!/bin/bash

#install docker to ubuntu

sudo apt-get update
sudo apt-get install apt-transport-https -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update
sudo apt-get install docker.io -y

sudo apt-get install docker-compose -y

# add user to docker group
sudo usermod -aG docker $USER



#Test docker
sudo docker run hello-world
