#!/bin/zsh

setopt err_exit
setopt pipe_fail
setopt no_unset




declare -g AZURE_SUBSCRIPTION_ID="${AZURE_SUBSCRIPTION_ID}"
declare -g AZURE_TENANT_ID="${AZURE_TENANT_ID}"

# login to the correct azure account
az login --tenant "$AZURE_TENANT_ID"
az account set --subscription "$AZURE_SUBSCRIPTION_ID"
az account show

