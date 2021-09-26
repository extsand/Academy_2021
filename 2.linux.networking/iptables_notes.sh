#Useful links
#1 https://www.hostinger.com/tutorials/iptables-tutorial

#2 !!! https://forum.ubuntu.ru/index.php?topic=107492.0

#3 https://help.ubuntu.ru/wiki/%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0_%D1%81%D0%B5%D1%82%D0%B8_%D0%B2%D1%80%D1%83%D1%87%D0%BD%D1%83%D1%8E

#4 https://losst.ru/prosmotr-pravil-iptables

#0. Prepare to start working
sudo apt-get update
sudo apt-get install iptables
sudo iptables -L -v
#0.1 Check default gateway
sudo ip route 

#1. Delete iptables rules
iptables -F
iptables -X
iptables -t mangle -F
iptables -t nat -F

#2. Check nat state
sudo iptables -t nat -L
#2.1 Check all rules in iptables
sudo iptables -L -v 


#3. Save and restore iptables settings
iptables-save > filename.txt
iptables-restore < file.txt

#4. Check iptables module in linux
sudo modprobe ip_tables
sudo echo 'ip_tables' >> /etc/modules

#5. Configure interfaces
sudo nano /etc/network/interfaces
sudo service networks restart

#====== Host VM ======
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
	address 10.0.5.1
	netmask 255.255.255.0
	network 10.0.5.0
	broadcast 10.0.5.255
	dns-nameserver 8.8.8.8

#====== Client VM ======
auto eth0
iface eth0 inet static
	address 10.0.5.2
	netmask 255.255.255.0
	network 10.0.5.0
	broadcast 10.0.5.255
	gateway 10.0.5.1 ##!!! IMPORTANT FOR CLIENT VM
	dns-nameserver 8.8.8.8

#6. Up and down interface
ifdown eth0
ifup eth0

#7. Set ip4-forward
sudo nano /etc/sysctl.conf
net.ipv4.ip_forward=1

#8. Create iptables rules
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo iptables -A FORWARD -i eth1 -o eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
sudo iptables -S

#8.1 For end-to-end transmitting
# sudo iptables -A FORWARD -i endIface -o inpIface -j ACCEPT

#9. Save iptables rules to file
sudo iptables-save > iptables_routing_devops

#10. Restore iptables rules from file
sudo iptables-restore < iptables_routing_devops



