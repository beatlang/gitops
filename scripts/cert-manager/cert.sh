#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
CERT_MANAGER_PATH="$SCRIPT_DIR/cert.yaml"

# Enable Cert Menager
echo "Enable cert manager"

microk8s enable cert-manager
microk8s kubectl apply -f "$CERT_MANAGER_PATH"

echo "Cert Manager installation complete!"
