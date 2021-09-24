#!/bin/bash

echo 'Networking tasks'

#1. Create virtual machines connection according to figure :
# more http://rus-linux.net/MyLDP/vm/VirtualBox-networking.html
# tips and tricks
# more https://ubuntugeeks.com/questions/23410/cannot-find-device-eth0
#
#|Itnernet|
# ^|
#|host|
# ^|
#|VM-1|
# ^|
#|VM-2|
#

sudo lshw -C network #Check network devices
sudo nano /etc/network/interfaces # create network
#====================================
eth0 # NAT
iface eth0 inet dhcp
#configure Host
#WorkNetwork
auto eth1
iface eth1 inet static
	address 192.168.58.1
	netmask 255.255.255.0
	network 192.168.58.0
	broadcast 192.168.58.255
#=====================================
# configure VM1
## WorkNetwork
auto eth0
iface eth0 inet static
	address 192.168.58.2
	netmask 255.255.255.0
	network 192.168.58.0
	broadcast 192.168.58.255
## Adapter to VM2
auto eth1
iface eth1 inet static
	address 192.168.59.1
	netmask 255.255.255.0
	network 192.168.59.0
	broadcast 192.168.59.255

#================================
# configure VM2
# Adapter to VM1
auto eth0
iface eth0 inet static
	address 192.168.59.2
	netmask 255.255.255.0
	network 192.168.59.0
	broadcast 192.168.59.255
	
# Algorius Net Viewer - for network images
# see network map: https://github.com/extsand/Academy_2021/blob/linux_1/img/Networking_Task1_1.jpg