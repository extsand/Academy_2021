# Intstances log and user data
# AWS -> Action -> Instance settings -> Edit User Dada 
# 	

# Terraform install

# Linux
mkdir ~/terraform
wget https://releases.hashicorp.com/terraform/1.0.8/terraform_1.0.8_linux_386.zip
unzip terraform_1.0.8_linux_386.zip
sudo mv terraform /usr/bin/
terraform --version

# Windows
https://www.terraform.io/downloads.html
mkdir terraform
add PATH to env.var

terraform -install-autocomplete


#Basic commands
terraform init
					plan
					apply
					destroy
					console file(...)
									template(...)
									exit
					show

#Upgrade terraform
#Just donwload new version from official page
del terraform.exe
add new terraform.exe



