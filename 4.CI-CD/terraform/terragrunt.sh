# more about
# https://terragrunt.gruntwork.io/docs/getting-started/install/#install-terragrunt

# downloads file from:
# https://github.com/gruntwork-io/terragrunt/releases
#  terragrunt_linux_amd64


# linux
mv terragrunt_linux_amd64 terragrunt
chmod u+x terragrunt
mv terragrunt /usr/local/bin/terragrunt

#windows
#also download terragrunt_windows_amd64
mkdir terraform
add PATH to env.var

#Basic commands
terragrunt run-all init
									 plan
									 apply
									 destroy
									 console file(...)
								           template(...)
								           exit
									 show

									 
