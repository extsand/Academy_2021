#!/bin/bash

echo 'Task 1'
user='username is....'
echo $user

passwd $user
#how to change info about user
usermod $key $username

#Task 1_1
man appname     # manual
help            # shell help info
less            # page to page output
info            # include information about os and more
finger          # similar on app
ls -la          # list file
ss              # socker list in system    
# ========================

#TAKS 1_2

tree            # tree of dir and files

# how to know type of file?
filename=''

file filename
file -b filename

#where i am?: pwd
pwd

#homedir:
cd ~
#rootdir:
cd / 

#list info about catalog
ls                  #file list
ls -l               # only visible file - file table
ls -a               # all file list
ls -la              # all file - file table
ll                  # shortcut for ls -la


#Create a subdirectories in the home dir
sudo mkdir /home/subdir/
# into create file with info about /dir
sudo /home/subdir/info.txt
cd /home/mkdir
ls ll > info.txt
# ls -la > /our dir

# view this file
cat info.txt 
# copy file with relative and absolute path
cp info.txt /home/subdir/info_cp.txt
#delete the file
rm -rf /home/subdir
#create test

sudo mkdir /home/test
cd /home/test
sudo history > labwork2

#soft and hard links
ln labwork2 link_hard_labwork2
ln -s labwork2 link_soft_labwork2
#hardlink - include all parent file. If we delete parent file - we still have body of parent file.
#softlink - it just link

#remove
mv link_hard_labwork2 hard_lnk_labwork2
mv link_soft_labwork2 symb_lnk_labwork2


#delete 
cd ..
rm -rf test

#find all files that contain the squid and traceroute sequence.

sudo find / -name 'squid'
sudo find / -name 'traceroute'

#which partitions are mounted in the system, as well as the types of
#these partitions.

sudo mount
sudo lspci          # I like it
sudo lsusb
sudo lsscsi
sudo lscpu
sudo lshw

#count lines in file
filename='text.txt'
wc -l filename


#Using the find command, find all files in the /etc directory containing the
# host character sequence.
# more about
# https://www.geeksforgeeks.org/find-command-in-linux-with-examples/
# ?????
# sudo find /etc ?????
# ????????
sudo find /etc | grep 'host'


# Organize a screen-by-screen print of the contents of the /etc directory. Hint:
# You must use stream redirection operations.
ls -la -R /etc
ll -R /etc


# What are the types of devices and how to determine the type of device? Give
# examples.
#https://tldp.org/LDP/tlk/dd/drivers.html - more about

#  character, block and network
# /dev/cua - character -dev without buffers
# block - 512 - 1024 bytes - accessed via buffer cache
# network - dev in the network



# List the first 5 directory files that were recently accessed in the /etc
# directory.

ls -1t | tail -5




