#!/bin/bash

echo "Nodo dev"

# see https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/
# altri spunti da https://jimmysong.io/en/posts/setting-up-a-kubernetes-cluster-with-vagrant/

mkdir -p /home/vagrant/.kube
mkdir -p /root/.kube

# copio il file salvato "config" in ~/.kube : mi consentirà di 
# usare "kubectl" dialogando direttamente con l'API SERVER da qualsiasi macchina.
# Il file config è stato salvato dal nodo master e contiene le chiavi tramite le quali
# si può dialogare in modo protetto con l'api di del nodo master.

cp /home/asw/_shared/resources/config /home/vagrant/.kube/config
cp /home/asw/_shared/resources/config /root/.kube/config