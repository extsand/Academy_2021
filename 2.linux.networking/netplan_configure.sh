#Configure netplan
# more https://vitux.com/how-to-configure-networking-with-netplan-on-ubuntu/
sudo nano /etc/netplan/00-network-manager-all.yaml

network:
    Version: 2
    Renderer: NetworkManager/ networkd
    ethernets:
       DEVICE_NAME:
          Dhcp4: yes/no
          Addresses: [IP_ADDRESS/NETMASK]
          Gateway: GATEWAY
          Nameservers:
             Addresses: [NAMESERVER_1, NAMESERVER_2]


sudo netplan try




