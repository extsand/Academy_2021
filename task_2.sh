#!/bin/bash
# sudo cat /etc/passwd
#s udo cat /etc/group
# pseudouser 10 - 100 id - system process which look like user
# real user 1000 - ....

# UID ranges
# What is UID?
# How to define it?
# User ID - identity user in system

# GID 
# GID how to define?
# Group ID - identity group in system

# Define user in group
cat /etc/group | grep 'username'

#Change username for user account
usermod -l login_name old_name
#Change groupname 
groupmod -n new_name old_name

#What is skell_dir?
#blueprint environment for new user
cd /etc/skel

# How to remove a user from the system (including his mailbox)?
userdel -r $username

#kill ssh connection
who 
pkill -9 -t pts/0                    #id user in sustem

# What commands and keys should be used to lock and unlock a user account?
# More about lock user
# https://www.thegeekdiary.com/unix-linux-how-to-lock-or-disable-an-user-account/
# Unlock account
# https://linuxamination.blogspot.com/2013/05/disable-and-enable-user-account-in-linux.html


usermod -L $username                #lock - we use lock in passwords

chage -E0 $username                #lock completly - we use lock in expired date
sudo usermod -e 2022-10-10 peter   #unloc completely - we manipulate with expired date


usermod -s /sbin/nologin $username  #lock add user to nologin
chsh -s /bin/bash $username         #unlock user



grep ^$username /etc/passwd         #check user in /sbin/nologin - if he is lock 
                                    #we'll see:    
                                    #peter:x:1003:1004:,,,:/home/peter:/sbin/nologin


#check accout status
passwd --status $username

# show expire date for account
chage -l $usermane

# HOW TO USE IN REAL PROJECTS?
# How to remove a user's password and provide him with a password-free
# login for subsequent password change?
# https://www.cyberciti.biz/faq/linux-delete-user-password/
sudo passwd -d $username


# Display the extended format of information about the directory, tell about
# the information columns displayed on the terminal.
# more about: 
# https://linuxize.com/post/how-to-list-files-in-linux-using-the-ls-command/
# - The file type.
# rwsxrwxrwt        The file permissions.
# 1                 Number of hard links to the file.
# root              File owner.
# root              File group.
# 245               File size.
# Oct 22 11:22:22   Date and Time.
# text.txt          File name.
ls -la
ll

# What access rights exist and for whom (i. e., describe the main roles)?
# Briefly describe the acronym for access rights.

# x       - execute
# r       - read
# w       - write
# s or S  - SUID bit
# t       - Sticky bit

# -         - Regular file
# b         - Block special file
# c         - Character special file
# d         - Directory
# l         - Symbolic link
# n         - Network file
# p         - FIFO - именованные каналы
# s         - Socket

#What is the sequence of defining the relationship between the file and the
# user?
# user create file
# file have owner and ownergroup

chown $old_owner $new_owner
chgrp $new_group $filename
chmod 744 $filename

#What is an example of octal representation of access rights? Describe the
#umask command.

# r = 4 
# w = 2
# x = 1

# rwx - 7 (4+2+1)
# rw- - 6 (4+2+0)
# r-x - 5 (4+0+1)
# r-- - 4 (4+0+0)
# -wx - 3 (0+2+1)
# -w- - 2 (0+2+0)
# --x - 1 (0+0+1)
# --- - 0 (0+0+0)

#Give definitions of sticky bits and mechanism of identifier substitution. Give
#an example of files and directories with these attributes.
chmod 1777 $filename
chmod o+t $filename
chmod 744 $filename # clear permissions
# Sticky bit - all can work with file but only owner can delete this file
#SUID bit - sudo user id bit
chmod u+s $filename
chmod u-s $filename



# What file attributes should be present in the command script?
# what is mean?
#!/bin/bash
# ????????????????????????