1 Удаление всех правил и цепочек.
iptables -F
iptables -X
iptables -t mangle -F
iptables -t nat -F

#проверка NAT
sudo iptables -t nat -L


2. Новые правила
iptables-save > filename.txt
iptables-restore < file.txt

===
sudo modprobe ip_tables
sudo echo 'ip_tables' >> /etc/modules

===

sudo nano /etc/network/interfaces
sudo service networks restart

auto eth1
iface eth1 inet static
	address 10.0.1.1
	netmask 255.255.255.0
	network 10.0.1.0
	broadcast 10.0.1.255


ifdown eth1
ifup eth1

sudo nano /etc/sysctl.conf
net.ipv4.ip_forward=1

sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo iptables -A FORWARD -i eth1 -o eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
sudo iptables -S
sudo iptables-save > iptables_routing_devops_2



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

