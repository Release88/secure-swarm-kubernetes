#!/bin/bash

echo 'Starting sentence application as a stack' 

# see https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/
kubectl create secret generic regcred --from-file=.dockerconfigjson=/home/vagrant/.docker/config.json --type=kubernetes.io/dockerconfigjson

# see https://kubernetes.io/docs/concepts/workloads/controllers/deployment/
kubectl apply -f sentence-stack.yaml