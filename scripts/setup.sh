#!/usr/bin/env bash

set -e

helpFunction() {
  echo ""
  echo "Usage: $0 -u username"
  echo -e "\t-u User to be added to the microk8s group"
  exit 1 # Exit script after printing help
}

if [ $EUID != 0 ]; then
  sudo "$0" "$@"
  exit $?
fi

while getopts "u:" opt; do
  case "$opt" in
  u) USERNAME="$OPTARG" ;;
  ?) helpFunction ;; # Print helpFunction in case parameter is non-existent
  esac
done

# Print helpFunction in case parameters are empty
if [ -z "$USERNAME" ]; then
  echo "Some or all of the parameters are empty"
  helpFunction
fi

# Begin script in case all parameters are correct
echo "Run the script with username: $USERNAME"

MICROK8S_SCRIPT_PATH="./microk8s/microk8s.sh"
ARGOCD_SRIPT_PATH="./argo/argocd.sh"
KUBESEAL_SRIPT_PATH="./kubeseal/kubeseal.sh"
CERT_SRIPT_PATH="./kubeseal/kubeseal.sh"

source $MICROK8S_SCRIPT_PATH
source $ARGOCD_SRIPT_PATH
source $KUBESEAL_SRIPT_PATH
source $CERT_SRIPT_PATH
