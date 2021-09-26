#!/bin/bash



file="apache_logs.txt"

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

function mostRequestIp(){
    file_out=$file
    grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" $1 | sort | uniq -c | sort -gr > $file_out
    {
        read line1
    } < $file_out
    echo $line1
}


function mostRequestPage(){
    file_out=$1
    awk '{print $7}' $1 | sort | uniq -c | sort -gr > $file_out
    {
        read line
    } < $file_out
    echo $line
}


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

# fileReader $file


# data=$(fileReader $file)
# echo $data


# parseData $data

function renderUI(){
    echo -e "Script 2 - Analise Apache log \n"
    echo -e "You will type one of parameters:"
    echo -e "1 - Most request IP"
    echo -e "2 - Most request page"
    echo -e "3 - How many requests were there from each ip"
    echo -e "4 - What non-existent pages were clients referred to?"
    echo -e "5 - What time did site get the most request?"
    echo -e "6 - What search bots have accessed the site? UA + IP"
    
    read key
    echo -e "---------------------"
    case "$key" in
        "1") echo 'Most request IP:'
                mostRequestIp;;
                
        # "2") echo 'Most request page:'
        #         mostRequestPage $file ;;
    esac



}

# renderUI 