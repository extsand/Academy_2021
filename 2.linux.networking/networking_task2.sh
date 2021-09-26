# DHCP - Dynamic Host Configuration Protocol
# 1. Use already created internal-network for three VMs (VM1-VM3). VM1 has NAT and internal,
# VM2, VM3 – internal only interfaces.


# 2. Install and configure DHCP server on VM1.
# (3 ways: using VBoxManage, DNSMASQ and ISC-DHSPSERVER).
# You should use at least 2 of them.

#Set config to Master machime
sudo apt-get update
sudo apt-get install dnsmasq

# /etc/dnsmasq.conf
sudo nano /etc/dnsmasq.conf
# add lines:
interface=eth1
dhcp-range=10.0.5.1,10.0.5.20,12h
#set interfaces
sudo nano /etc/network/interfaces

#add lines:
auto eth1
iface eth1 inet static
	address 10.0.5.1
	netmask 255.255.255.0

# 3. Check VM2 and VM3 for obtaining network addresses from DHCP server.
#set interfaces on slave machines
sudo nano /etc/network/interfaces
#add lines:
auto eth0
	iface eth0 inet dhcp


# 4. Using existed network for three VMs (from p.1) install and configure DNS server on VM1. (You can use DNSMASQ, BIND9 or something else).


# 5. Check VM2 and VM3 for gaining access to DNS server (naming services).
ping google.com
dig google.com
nslookup google.com

6. ***Using the scheme which follows, configure dynamic routing using OSPF protocol.
#See more http://linuxshare.ru/docs/HOWTO/lartc-HOWTO/c2925.html


# Ifconfig VM1-3
# https://github.com/extsand/Academy_2021/blob/linux_1/img/img-networking/Networking_Task2-ifconfig.jpg

#Ping to google.com
# https://github.com/extsand/Academy_2021/blob/linux_1/img/img-networking/Networking_Task2-ping.jpg
