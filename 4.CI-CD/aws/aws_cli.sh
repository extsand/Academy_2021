#Install AWS CLI
#https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install


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





#AWS CLI
# https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html
# https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html

#for default profile
aws configure 

#for custom profile
aws configure --profile custom-profile

#see configuration
aws configure list 

#see configuration for custom profile
aws configure list --profile custom-profile

#to configure from file
aws configure import --csv file://credentials.csv

#info about profiles
aws configure list-profiles


 



AWS ecr access
https://aws.amazon.com/ru/premiumsupport/knowledge-center/secondary-account-access-ecr/