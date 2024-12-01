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


#Alternative install docker + docker portainer
curl -sSL https://get.docker.com | sh
sudo docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:linux-arm
