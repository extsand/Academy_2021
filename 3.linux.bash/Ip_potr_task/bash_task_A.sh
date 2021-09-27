#!/bin/bash
#More about host and port
#https://www.cyberciti.biz/faq/unix-linux-check-if-port-is-in-use-command/

#Get ip addr from ifconfig
function getIp(){
    ip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' `
    echo ${ip:0:10}  
}

#Show info about all host
function showIpAllHosts(){
    ip=$(getIp)
    # type of nmap
    # nmap -sL -n -A $ip.0/30
    # nmap -A $ip.0/24
    # nmap -sP 192.168.56.*
    nmap -A $ip.*
    
}

#Show Open TCP ports
function showOpenTCP_ports(){
    sudo ss -tulpn | grep LISTEN
}

#Render UI
function renderUI(){
echo -e "Script 1 - Network scan \n"
echo -e "You will type one of parameters:"
echo -e "--all - this key display IP adrdesses and symbolic names of all hosts in the current subnet"
echo -e "--target - this key displays a list of open system TCP ports \n"
read key

case "$key" in 
    "all" | "--all" | "a") echo "IP adrdesses in current network:" 
                    showIpAllHosts;;
    "target" | "--target" | "t" ) echo "Open TCP ports:"
                    showOpenTCP_ports;;
esac
}

renderUI






