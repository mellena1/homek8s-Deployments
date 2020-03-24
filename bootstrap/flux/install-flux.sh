#!/bin/bash

helm repo add fluxcd https://charts.fluxcd.io

helm upgrade flux \
    -f flux-values.yaml \
    --version 1.2.0 \
    --wait \
    --install \
    --namespace devops \
    fluxcd/flux

helm upgrade flux-helm-operator \
    -f helm-op-values.yaml \
    --version 0.7.0 \
    --wait \
    --install \
    --namespace devops \
    fluxcd/helm-operator
