#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
ARGOCD_VALUES_PATH="$SCRIPT_DIR/values.yaml"

# Enable ArgoCD with params
echo "Enable argocd with values from $ARGOCD_VALUES_PATH"

microk8s enable argocd -f $ARGOCD_VALUES_PATH