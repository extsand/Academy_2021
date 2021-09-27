#!/bin/bash

file="apache_logs.txt"

function mostRequestIp(){
    file_out=file_buffer
    # echo $file_out
    grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" $1 | sort | uniq -c | sort -gr > $file_out
    {
        read line1
    } < $file_out
    echo 'Most request IP is: '
    echo $line1
}

function mostRequestPage(){
    file_out=file_buffer
    awk '{print $7}' $1 | sort | uniq -c | sort -gr > $file_out
    {
        read line
    } < $file_out
    echo 'Most request Page is:'
    echo $line
}

function howManyRequestFromEachIP(){
    file_out=file_buffer
    awk '{print $1}' $1 | sort | uniq -c | sort -gr > $file_out
    echo 'Count of requests from IP: '
    while read line
        do
            echo $line
    done < $file_out
   
}

function nonExistPages(){
    file_out=file_buffer
    awk '{print $7}' $1 | sort | uniq -c | sort -gr | grep error404 > $file_out
    {
        read line
    } < $file_out
    echo 'Request to non-exist pages is:'
    echo $line
}


function mostRequestTime(){
    file_out=file_buffer
    awk '{print $4}' $1 | sort | uniq -c | sort -gr > $file_out
    {
        read line
    } < $file_out
    echo 'The most requests time is:'
    echo $line   
}

function showSearchBots(){
    file_out=file_buffer
    awk '{print $14}' $1 | sort | uniq -c | grep -E 'bot|Bot' | sed 's/.$//' > $file_out
    echo 'Search bot is: '
    # {
    #     read line
    # } < $file_out
    # echo $line
   
    while read line
        do
            echo $line
    done < $file_out
}


# showSearchBots $file
# mostRequestTime $file
# nonExistPages $file
# howManyRequestFromEachIP $file
# mostRequestPage $file
# mostRequestIp $file

