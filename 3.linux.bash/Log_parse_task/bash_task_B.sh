#!/bin/bash

file="apache_logs.txt"

#From which ip were the most requests?
function mostRequestIp(){
    file_out=file_buffer
    # echo $file_out
    grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" $1 | sort | uniq -c | sort -gr > $file_out
    {
        read line1
    } < $file_out
    echo '---------------------------'
    echo 'Most request IP is: '
    echo $line1
}

# What is the most requested page?
function mostRequestPage(){
    file_out=file_buffer
    awk '{print $7}' $1 | sort | uniq -c | sort -gr > $file_out
    {
        read line
    } < $file_out
     echo '---------------------------'
    echo 'Most request Page is:'
    echo $line
}
# How many requests were there from each ip?
function howManyRequestFromEachIP(){
    file_out=file_buffer
    awk '{print $1}' $1 | sort | uniq -c | sort -gr > $file_out
    echo '---------------------------'
    echo 'Count of requests from IP: '
    while read line
        do
            echo $line
    done < $file_out
   
}

#What non-existent pages were clients referred to?
function nonExistPages(){
    file_out=file_buffer
    awk '{print $7}' $1 | sort | uniq -c | sort -gr | grep error404 > $file_out
    {
        read line
    } < $file_out
    echo '---------------------------'
    echo 'Request to non-exist pages is:'
    echo $line
}

# What time did site get the most requests?
function mostRequestTime(){
    file_out=file_buffer
    awk '{print $4}' $1 | sort | uniq -c | sort -gr > $file_out
    {
        read line
    } < $file_out
    echo '---------------------------'
    echo 'The most requests time is:'
    echo $line   
}

# What search bots have accessed the site? (UA + IP)
function showSearchBots(){
    file_out=file_buffer
    awk '{print $14}' $1 | sort | uniq -c | grep -E 'bot|Bot' | sed 's/.$//' > $file_out
    echo '---------------------------'
    echo 'Search bot is: '  
    while read line
        do
            echo $line
    done < $file_out
}


function renderUI(){
    echo -e "---------------------"
    echo -e "Script 2 - Analise Apache log \n"
    echo -e "You will type one of parameters:"
   

    select key in "Most requesr IP" "Most request page" "How many requests were there from each ip" "What non-existent pages were clients referred to?" "What time did site get the most request?" "What search bots have accessed the site? UA + IP" "Exit";
        do
            case $key in
                "Most requesr IP") mostRequestIp $1;;
                "Most request page") mostRequestPage $1;;
                "How many requests were there from each ip") howManyRequestFromEachIP $1;;
                "What non-existent pages were clients referred to?") nonExistPages $1;;
                "What time did site get the most request?") mostRequestTime $1;;
                "What search bots have accessed the site? UA + IP") showSearchBots $1;; 
                "Exit") break;;
                *) echo 'You value is not correct!';;
            esac
    done      
}   

renderUI $file















#============================ NOTES ================

# function botInfo(){
#     if [ "CPU" != "$1" ] && [ "Linux" != "$1" ] && [ "Android" != "$1" ]
#         then
#             if [[ $1 == *"bot"* ]]
#                 # then echo $1 $2 
#                 #CODE HERE  
#                 then echo ''                    
#             fi
#     fi
# }   


# function parseData(){
#         # 1      2 3          4                     5     6        7        8   9   10     11        12
#     # 46.29.2.62 - - [30/Sep/2015:00:15:01 +0300] "GET /graffiti HTTP/1.0" 200 146 "-" "Wget/1.12 (linux-gnu)"
#     # echo $1 $2 $3 $4 $5 $6 $7 $8 $9 ${10} ${11} ${12} ${13}
#     # echo -e "1 $1\n 2 $2\n3 $3\n 4 $4\n 5 $5\n 6 $6\n 7 $7\n 8 $8\n 9 $9\n 10 ${10}\n 11 ${11}\n 12 ${12}\n 13 ${13}\n"
#     ip=$1
#     dateTime=${4:1}
#     request=${6:1}
#     page=$7
#     codeAnswer=$9
#     browser=${12:1}
#     type=${13}
#     bot=${14}
    
#     # echo $ip $dateTime $request $codeAnswer $browser $type $bot
#     botInfo $bot $ip
    

# }
# function fileReader(){
#     while read line
#     do
#         parseData $line
#     done < $1
# }
# data=$(fileReader $file)
# echo $data
# parseData $data




# function renderUI(){
#     echo -e "---------------------"
#     echo -e "Script 2 - Analise Apache log \n"
#     echo -e "You will type one of parameters:"
#     echo -e "1 - Most request IP"
#     echo -e "2 - Most request page"
#     echo -e "3 - How many requests were there from each ip"
#     echo -e "4 - What non-existent pages were clients referred to?"
#     echo -e "5 - What time did site get the most request?"
#     echo -e "6 - What search bots have accessed the site? UA + IP"
#     echo -e "q - for Exit"
#     read key
#     echo -e "---------------------"
   
#     case "$key" in
#         "1") mostRequestIp $1;;
#         "2") mostRequestPage $1;;
#         "3") howManyRequestFromEachIP $1;;
#         "4") nonExistPages $1;;
#         "5") mostRequestTime $1;;
#         "6") showSearchBots $1;; 
                 
#     esac

# }


# function interactiveApp(){
#     key=0 
#     while [ $key != "q" ]
#         do 
#             renderUI $1 
#     done
# }


# interactiveApp $file