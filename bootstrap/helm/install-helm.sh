#!/bin/bash

kubectl apply -f rbac-config.yaml
# Need the override because of an incompatibility with k8s 1.16.x (https://github.com/helm/helm/issues/6374)
helm init --service-account tiller --wait --history-max 10 --skip-refresh --upgrade --override spec.selector.matchLabels.'name'='tiller',spec.selector.matchLabels.'app'='helm' --output yaml | sed 's@apiVersion: extensions/v1beta1@apiVersion: apps/v1@' | kubectl apply -f -
