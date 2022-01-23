#!/bin/bash
echo 'Set env from AWS System Manager'
echo 'AWS Parameter Store'

export APP_USERNAME=`aws ssm get-parameters --name APP_USERNAME --region eu-central-1 --output text --query Parameters[].Value`
export APP_DB=`aws ssm get-parameters --name APP_DB --region eu-central-1 --output text --query Parameters[].Value`
export APP_PASSWORD=`aws ssm get-parameters --name APP_PASSWORD --region eu-central-1 --with-decryption --output text --query Parameters[].Value`

env | grep "APP_"