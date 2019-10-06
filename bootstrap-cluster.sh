#!/bin/bash

# Install helm
cd bootstrap/helm
./install-helm.sh
cd ../..

# Add secret for sealed-secrets
cd bootstrap/sealed-secrets
./add-key.sh
cd ../..

# Install flux
cd bootstrap/flux
./install-flux.sh
cd ../..

# Output Flux git deploy key and copy to keyboard
FLUX_POD=$(kubectl get pods --namespace flux -l "app=flux,release=flux" -o jsonpath="{.items[0].metadata.name}")
KEY=$(kubectl -n flux logs $FLUX_POD | grep identity.pub | cut -d '"' -f2)
echo $KEY
echo $KEY | pbcopy
