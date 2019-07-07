#!/bin/bash

source "/home/asw/_shared/scripts/common.sh"

# comando standard di kubernetes per lanciare pod, deployments e servizi

kubectl apply -f ${ASW_RESOURCES}/registry-pod.yaml
kubectl apply -f ${ASW_RESOURCES}/registry-port.yaml