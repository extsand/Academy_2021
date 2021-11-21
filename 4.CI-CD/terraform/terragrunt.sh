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

									 


# more about debug
# https://terragrunt.gruntwork.io/docs/features/debugging/
# this mode can help for getting info about variables and data whose sent between terraform modules
terragrunt run-all apply --terragrunt-log-level debug --terragrunt-debug

# conversation between modules works like that:
# ================== pseudocode bellow:

# >>> module-1.tf
output data_from_module_1

# >>>module-2.tf
variable data_variable

# >>>terragrunt.hlc for module-2.tf
dependency "module-1"{
	config_path = "../module-1"
	mock_outputs = {
		#grab data from module-1
		data_from_module_1 = "data-dummy-00000000"
	}
}

inputs = {
		data_variable = dependency.module-1.outputs.data_from_module_1
		# for debug mode
		# buffer-value = dependency.module-1.outputs.*
	}
# ================== pseudocode end:
