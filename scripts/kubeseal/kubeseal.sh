#!/usr/bin/env bash

apt-get install jq

# Fetch the latest sealed-secrets version using GitHub API
KUBESEAL_VERSION=$(curl -s https://api.github.com/repos/bitnami-labs/sealed-secrets/tags | jq -r '.[0].name' | cut -c 2-)

# Install kubeseal latest version
echo "Installing kubeseal version $KUBESEAL_VERSION..."

# Check if the version was fetched successfully
if [ -z "$KUBESEAL_VERSION" ]; then
    echo "Failed to fetch the latest KUBESEAL_VERSION"
    exit 1
fi

wget "https://github.com/bitnami-labs/sealed-secrets/releases/download/v${KUBESEAL_VERSION}/kubeseal-${KUBESEAL_VERSION}-linux-arm64.tar.gz"
tar -xvzf kubeseal-${KUBESEAL_VERSION}-linux-arm64.tar.gz kubeseal
sudo install -m 755 kubeseal /usr/local/bin/kubeseal

# Kube config hack for current user 
sudo -u $USERNAME -H sh -c "mkdir -p ~/.kube; microk8s config > ~/.kube/config"

echo "Kubeseal installation complete!"