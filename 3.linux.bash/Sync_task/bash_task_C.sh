#!/bin/bash

# Uncoment for using arg
# path_from=$1
# path_to=$2
# log_file=$3

path_from="./sync/"
path_to="./vault"
log_file="./log_backup.txt"


# sudo rm -rf "$path_from*"

function createLog(){
    file_name=$1
    operation_name=$2
    log_file=$3
    dataTime=$(date)

    echo "$dataTime $file_name $operation_name" >> $3
}

#==================== QUESTION
#How to delete file from folder with BASH
# rm -rf ./folder/* - doesn't work in script

function deleteOldFiles(){
    path_from=$1
    path_to=$2
    log_file=$3
    operation="DELETE_OLD"
    echo "Delete Old files "
    rm -rf "$path_to"
    echo "Old file was delete"
    createLog "$path_to $path_to" "$operation" "$log_file"

}



function copyToVault(){
    path_from=$1
    path_to=$2
    log_file=$3
    operation="COPY"
    echo "Copy $path_from to $path_to"
    cp -a "$path_from." $path_to
    # rsync -r $sourse/ $dest
    echo "All file was copied"
    createLog "$path_to $path_from" "$operation" "$log_file"

}

deleteOldFiles $path_from $path_to $log_file
copyToVault $path_from $path_to $log_file


# echo `$path_from/.`





