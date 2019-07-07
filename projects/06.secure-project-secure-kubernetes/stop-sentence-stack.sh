#!/bin/bash

echo 'Stopping sentence application as a stack' 

kubectl delete -f sentence-stack.yaml
kubectl delete -f https://raw.githubusercontent.com/google/metallb/v0.7.3/manifests/metallb.yaml
kubectl delete -f /home/asw/_shared/resources/load-balancer-configuration.yaml