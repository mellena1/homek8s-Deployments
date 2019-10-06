#!/bin/bash

helm repo add fluxcd https://charts.fluxcd.io

kubectl apply -f https://raw.githubusercontent.com/fluxcd/flux/helm-0.10.1/deploy-helm/flux-helm-release-crd.yaml

helm upgrade flux -f values.yaml \
    --version 0.14.1 \
    --wait \
    --install \
    --namespace devops \
    weaveworks/flux
