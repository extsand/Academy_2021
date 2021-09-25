Основная папка с лекциями и заданиями DevOPS
https://docs.google.com/document/d/1WiDGFE7rcdOnGHtie3saPNmYfpU0ZX33GEroOm35Dp8/edit?usp=sharing

GoogleMeet
Суббота 15:00
https://meet.google.com/rjx-mmbo-yyz

sudo apt update



# -o  -i
-i input
-o output
echo 'net.ipv4.ip_forward = 1' >>/etc/sysctl.conf; sysctl -p

iptables -t nat -A POSTROUTING -o eth1 ! -i eth0 -j MASQUERADE
-s 192.192.1.0/24
-d 192.192.8.0/24

##ЗАМЕТКА
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
##LECTIONS
#install iptables
sudo apt-get update
sudo apt-get install iptables
sudo iptables -L -v


#more https://www.hostinger.com/tutorials/iptables-tutorial
sudo iptables -L -v #Show iptables

sudo iptables -t nat -A POSTROUTING -o endIface -j MASQUERADE
sudo iptables -A FORWARD -i inpIface -o endIface -m state --state RELATED,ESTABLISHED -j ACCEPT

sudo iptables -A FORWARD -i inpIface -o endIface -j ACCEPT
#Для сквозной передачи
# sudo iptables -A FORWARD -i endIface -o inpIface -j ACCEPT

sudo iptables -S


iptables-save >/etc/iptables.conf


dig g.co


##### ==========================================================
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo iptables -A FORWARD -i eth1 -o eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -SYN





iptables -t nat -A POSTROUTING -s 192.168.0.0/24 ! -d 192.168.0.0/24 -j MASQUERADE
iptables -t mangle -A FORWARD -p tcp -m tcp --tcp-flags RST,SYN SYN -j TCPMSS --clamp-mss-to-pmtu
iptables-save >/etc/iptables.conf