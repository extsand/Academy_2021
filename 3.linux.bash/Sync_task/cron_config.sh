# Crontab generator
# https://crontab-generator.org/


sudo chmod +x script_name.sh

#make dir with file
sudo mkdir /home/crontab

#create file tasks
sudo nano /home/crontab/crontab_event

#setting in file
SHELL=/bin/bash
* * * * * ./bash_task_C.sh >/dev/null 2>&1


#add command to crontab
sudo crontab /home/crontab/crontab_event

#show crontab
sudo crontab -l

#clear crontab
sudo crontab -r 