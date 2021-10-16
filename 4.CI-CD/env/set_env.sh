#!/bin/bash
echo 'Set env for app'

export APP_PORT=5000
export APP_HOST=192.198.1.98
export APP_DB_HOST=194.123.293.1

env | grep 'APP'


#run
# . ./set_env.sh