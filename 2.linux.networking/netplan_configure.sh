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


# WORKING EXAMPLE

network:
  ethernets:
    enp0s3:
      dhcp4: no
      addresses: [192.168.1.8/24]
      gateway4: 192.168.1.1
      nameservers:
        addresses: [8.8.8.8,8.8.4.4]
  version: 2






