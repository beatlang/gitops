#!/usr/bin/env bash

# See Kubeflow/K8S compatibility matrix : https://www.kubeflow.org/docs/started/k8s/overview/#minimum-system-requirements
export K8S_VERSION="latest/stable"

# -----------------------------------
#  Setup microk8s with snap (Ubuntu)
# -----------------------------------
# See Snap Documentation : http://manpages.ubuntu.com/manpages/xenial/man1/snap.1.html
# See MicroK8S blog post : https://itnext.io/working-with-image-registries-and-containerd-in-kubernetes-63c311b86368

# Install microk8s based on the specified version
echo "Installing microk8s version $K8S_VERSION..."

snap install --channel=$K8S_VERSION microk8s --classic

usermod -a -G microk8s $USERNAME
chown -f -R $USERNAME ~/.kube

# Wait for the Kubernetes services to initialise
echo "Waiting for microk8s ready status"
microk8s.status --wait-ready

# Enable required add-ons
echo "Enabling required microk8s add-ons"
microk8s enable dns
microk8s enable ingress
microk8s enable cert-manager
microk8s enable community
microk8s enable hostpath-storage

echo "Microk8s installation complete!"