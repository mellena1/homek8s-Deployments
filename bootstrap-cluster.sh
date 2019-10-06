#!/bin/bash

# Install helm
echo "Installing helm"
cd bootstrap/helm
./install-helm.sh
cd ../..

# Add secret for sealed-secrets
echo "Installing sealed-secrets"
cd bootstrap/sealed-secrets
./add-key.sh
cd ../..

# Install flux
echo "Installing flux"
cd bootstrap/flux
./install-flux.sh
cd ../..

# Output Flux git deploy key and copy to keyboard
KEY=$(fluxctl identity --k8s-fwd-ns devops)
echo $KEY
echo $KEY | pbcopy
