#!/bin/bash

# full cleaning
sudo service jenkins stop
# sudo apt-get purge jenkins*
sudo apt-get remove --purge jenkins

#install Jenkins to linux server

sudo apt-get update 
sudo apt-get install openjdk-8-jre #Important!
# sudo apt-get install openjdk-11-jre
sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update 
sudo apt-get install jenkins -y


sudo service jenkins status
# admin password for reset
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

#==============================================
# AWS-instance
# More about
# https://www.jenkins.io/doc/tutorials/tutorial-for-installing-jenkins-on-AWS/#configure-jenkins

sudo yum update 
# sudo yum install openjdk-8-jre #Important!+
# sudo apt-get install openjdk-11-jre
sudo amazon-linux-extras install java-openjdk11
sudo yum install java-1.8.0-openjdk
java -version

sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade
sudo yum install epel-release java-11-openjdk-devel

#if we have error
sudo amazon-linux-extras install epel
# sudo yum install epel-release -y  
sudo yum install daemonize -y  


sudo yum install jenkins
sudo systemctl daemon-reload


# admin password for reset
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

sudo chmod -r g+wget
#SSH Settings
ssh-keygen -t rsa -b 4096 -m PEM
ssh -T git@github.com
ssh -vT git@github.com

# SSH setting 
sudo apt install openssh-server
sudo systemctl enable sshd
sudo systemctl disable sshd
ssh localhost

sudo ssh -p 2222 localhost 
sudo ufw allow 2222
sudo ufw allow 22


#========================================
#Configure vw-local
# IMPORTANT - create ssh only from user/admin
ssh-keygen -t rsa -b 4096 -m PEM
ssh-copy-id -i ~/.ssh/name_of_key.pub vm-user@192.168.1.5
# cat /home/vm-user/.ssh/name_of_key.pub
# or inner file

sudo nano /etc/ssh/sshd_config
#add
PermitRootLogin without-password


sudo apt-get update
sudo apt-get install apache2
# for smooth jenkins
sudo chown -R $USER:$USER html/




#========================================
#Git-hub SSH confirure
# add key to secure Git vault
# .ssh/config
Host github.com
  IdentityFile ~/.ssh/git/name_of_key
# add public key to GitHub SSH keys 

#~/.ssh/name_of_key.pub
sudo chmod 400 name_of_key
#some ssh folder owner issue
sudo chown -R $USER ~/.ssh/

# testing
ssh -vT git@github.com


#====================================
# Jenkins Publish Over SSH
# ** - copy all files and directories 
# Check Disable exec - in SSH settingr
# important settings  .ssh - chmod 700
											# ssh_key - chmod 600
#Folder 



