sudo chmod +x script_name.sh

#make dir witn file
sudo mkdir /home/crontab

#create file
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