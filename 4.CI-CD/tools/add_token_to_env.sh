#!/bin/bash
echo 'Set git token to ENV'
# set env
export TF_VAR_git_token="git-token-past-here"
env | grep 'TF_VAR_git_token'
#remove env
unset TF_VAR_git_token



#get os version
cat /etc/*-release

# ip locate
#more about
# https://webhamster.ru/mytetrashare/index/mtb0/1431788953nxzz37zrvs

#get personal ip adress
wget -O - -q icanhazip.com
#or
wget -q -O - ifconfig.me/ip
#or
curl ifconfig.me/ip


#AWS ec2 Ubuntu 18
sudo snap install core; sudo snap refresh core
sudo snap install --classic certbot
sudo certbot certonly --standalone