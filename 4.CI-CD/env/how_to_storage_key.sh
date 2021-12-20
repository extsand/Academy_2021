#Type of env:
# 1. Env OS layer
# 2. Env User layer
# 3. Env Session Login User layer
# 4. Env App layer

#Python Example
MY_API_KEY = os.getenv('MY_API_KEY')



#Example for Linux

# 1. Env OS layer - will working if system will be reboot
#env storage is
sudo nano etc/environment
MY_OS_VAR='env_os_var'

echo $MY_VAR

# 2. Env User layer
# aliase also here
~/.bashrc
export MY_USER_VAR=env_user_var

# 3. Env Session Login User layer
export SESSION_VAR=session_var_is_11234

# 4. Env App layer

PYTHON_ENV='MY_APP_var' python python_app.py

ENV_1='MY_APP_var' ENV_2='f545' ENV_3='523235' python python_app.py
#Python Example
#python_app.py
import os
print(os.getenv('PYTHON_ENV'))




#set_env.sh
export VAR_NAME='var-value'
#run
. ./set_env.sh
#or
source ./set_env.sh





#Example for Windows

