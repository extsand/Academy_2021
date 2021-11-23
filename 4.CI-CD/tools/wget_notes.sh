#!/bin/bash

TERRAFORM_VERSION="1.0.10"
TERRAGRUNT_VERSION="0.35.6"

echo "wget example"

wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_386.zip -O terraform.zip
unzip terraform.zip
chmod u+x terraform
sudo mv terraform /usr/local/bin/
rm -rf terraform.zip

wget https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 -O terragrunt
chmod u+x terragrunt
sudo mv terragrunt /usr/local/bin/
