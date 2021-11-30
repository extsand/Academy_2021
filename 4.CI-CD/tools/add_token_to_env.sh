#!/bin/bash
echo 'Set git token to ENV'
# set env
export TF_VAR_git_token="git-token-past-here"
env | grep 'TF_VAR_git_token'
#remove env
unset TF_VAR_git_token



#get os version
cat /etc/*-release

#See symbols in file
cat -e -t -v Makefile 


# ip locate
#more about
# https://webhamster.ru/mytetrashare/index/mtb0/1431788953nxzz37zrvs

#Get personal ip adress
wget -O - -q icanhazip.com
#or
wget -q -O - ifconfig.me/ip
#or
curl ifconfig.me/ip

#Health Chek
# https://aws.amazon.com/ru/premiumsupport/knowledge-center/troubleshoot-unhealthy-checks-ecs/
curl -I http://${IPADDR}:8080/health
curl -I http://mypage.com:8080/






#AWS ec2 Ubuntu 18
sudo snap install core; sudo snap refresh core
sudo snap install --classic certbot
sudo certbot certonly --standalone

