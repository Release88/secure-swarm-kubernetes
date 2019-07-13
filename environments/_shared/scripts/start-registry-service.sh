#!/bin/bash

source "/home/asw/_shared/scripts/common.sh"

# comando standard di kubernetes per lanciare pod, deployments e servizi

# https://kubernetes.io/docs/tasks/configure-pod-container/
kubectl apply -f ${ASW_RESOURCES}/registry-pod.yaml

# https://kubernetes.io/docs/concepts/services-networking/service/
kubectl apply -f ${ASW_RESOURCES}/registry-port.yaml