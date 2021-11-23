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


# AWS CLI 
aws sts get-caller-identity

CLUSTER_NAME="some"
SERVICE_ARN="arn"
TASK_DEF="definition"

aws ecs list-services --cluster $CLUSTER_NAME
aws ecs describe-services --cluster $CLUSTER_NAME --service $SERVICE_ARN
aws ecs describe-task-definition --task-definition $TASK_DEF 

aws elbv2 describe-load-balancers 
aws elbv2 describe-load-balancers | jq -r '.LoadBalancers[].DNSName'