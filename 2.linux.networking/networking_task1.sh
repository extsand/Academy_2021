#!/bin/bash

echo 'Networking tasks'

#1. Create virtual machines connection according to figure :
# more http://rus-linux.net/MyLDP/vm/VirtualBox-networking.html
# tips and tricks
# more https://ubuntugeeks.com/questions/23410/cannot-find-device-eth0
# more https://forum.ubuntu.ru/index.php?topic=255114.0 ----- Important
#
#|Itnernet|
# ^|
#|host|
# ^|
#|VM-1|
# ^|
#|VM-2|
#


#1. EXTENDED APPROACH
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
# see network map: https://github.com/extsand/Academy_2021/blob/linux_1/img/img-networking/Networking_Task1_1-extended_approach.jpg


#Classical exercise
# see config: https://github.com/extsand/Academy_2021/blob/linux_1/img/img-networking/Networking_Task1_1_ip.jpg
sudo nano /etc/network/interfaces
====== Host VM ======
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
	address 10.0.5.1
	netmask 255.255.255.0
	network 10.0.5.0
	broadcast 10.0.5.255
	dns-nameserver 8.8.8.8

====== Client VM ======
auto eth0
iface eth0 inet static
	address 10.0.5.2
	netmask 255.255.255.0
	network 10.0.5.0
	broadcast 10.0.5.255
	gateway 10.0.5.1
	dns-nameserver 8.8.8.8


# 2. VM2 has one interface (internal), VM1 has 2 interfaces (NAT and internal). Configure all network
# interfaces in order to make VM2 has an access to the Internet (iptables, forward, masquerade).

echo 'net.ipv4.ip_forward = 1' >>/etc/sysctl.conf; sysctl -p
iptables -t nat -A POSTROUTING -s 192.168.0.0/24 ! -d 192.168.0.0/24 -j MASQUERADE
iptables -t mangle -A FORWARD -p tcp -m tcp --tcp-flags RST,SYN SYN -j TCPMSS --clamp-mss-to-pmtu
iptables-save >/etc/iptables.conf


# 3. Check the route from VM2 to Host.
traceroute 10.0.5.1


# 4. Check the access to the Internet, (just ping, for example, 8.8.8.8).
ping 216.58.209.14
# https://github.com/extsand/Academy_2021/blob/linux_1/img/img-networking/Networking_Task1_1-1.4_Ping.JPG

# 5. Determine, which resource has an IP address 8.8.8.8.
nslookup 8.8.8.8

# 6. Determine, which IP address belongs to resource epam.com, softserveinc.com
host epam.com
# 3.214.134.159
host softserveinc.com
# 45.60.63.61

# 7. Determine the default gateway for your HOST and display routing table.
sudo ip route 
ip route

# 8. Trace the route to google.com
traceroute google.com
