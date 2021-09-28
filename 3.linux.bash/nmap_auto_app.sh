#!/bin/bash
# Read more
# https://nmap.org/man/ru/man-host-discovery.html


# nmap –O 10.0.0.1-42


ip='192.168.1.5'
echo 'Set options'

function setTarget(){
    read ip
    echo $ip
    return ip
}

function pingReturnList(){
    echo 'Return ip list'
    nmap -sL $1
}

function pingScan(){
    echo 'Sipmle ip scanning'
    nmap -sP $1
}

function verboseScan(){
    echo 'Verbose scan'
    nmap -v -A $1
}

function typeOfOs(){
    echo 'Check OS'
    sudo nmap -O $1 
}

function checkOpenPorts(){
    echo 'Check open ports'
    sudo nmap $1
}

function checkPortAndServices(){
    echo 'Check ports and sevices'
    sudo nmap -sV $1
}

function whoIsMyNetwork(){
    echo 'Check IP around'
    nmap –sP $1
}


# nmap -sn $ip
# nmap -v -A $ip
# apr -a -n

# nmap $ip

# sudo nmap -v -A $ip

# options+=("Ping scan", "Detail scan", "Exit")

# select opt in "${options[@]}"
select opt in "Ping scan" "Detail scan" "Exit"
do 
    case $opt in
        "Ping scan") setTarget ;;
        "Detail scan") ping $ip;;
        "Exit") echo 'EXIT' break;;
        *) echo 'Wrong key';;
    esac
done


