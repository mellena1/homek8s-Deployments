#!/bin/bash

kubectl apply -f rbac-config.yaml
helm init --service-account tiller --wait --history-max 10 --skip-refresh --upgrade
