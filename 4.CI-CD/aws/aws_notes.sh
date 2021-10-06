#Python examples from AWS 
# https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/tutorials.html


# Intstances log and user data
# AWS -> Action -> Instance settings -> Edit User Dada 
# 																	 ->

#Configure AWS Instances


#Install httpd Server
sudo yum update httpd
sudo yum install httpd
sudo service httpd restart


l
#Install AWS CLI 
# See more
# https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.htm
# windows
# C:\Users\User-name\.aws
| - config
|	- credentials
# SSH
# C:\Users\Aleksandr\.ssh
| - ssh_key
| - ssh_key.pub
| - known_hosts
| - config
#confis include:
# Host gitlab.com
# IdentityFile /c/Users/Aleksandr/.ssh/ssh_key

# Host github.com
# IdentityFile /c/Users/Aleksandr/.ssh/ssh_key


