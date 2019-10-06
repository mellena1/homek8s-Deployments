#!/bin/bash

helm repo add fluxcd https://charts.fluxcd.io

helm upgrade flux -f values.yaml \
    --version 0.14.1 \
    --wait \
    --install \
    --namespace devops \
    fluxcd/flux
