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
    awk '{print $6}' $1 | sort | uniq -c | sort -gr > $file_out
    {
        read line
    } < $file_out
    echo 'Non Exist pages'
    echo $line
}

nonExistPages $file

# howManyRequestFromEachIP $file
# mostRequestPage $file
# mostRequestIp $file

