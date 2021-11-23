#!/bin/bash
echo 'Set git token to ENV'
export TF_VAR_git_token="git-token-past-here"
env | grep 'TF_VAR_git_token'