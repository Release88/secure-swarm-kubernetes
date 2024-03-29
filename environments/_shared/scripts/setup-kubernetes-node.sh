#!/bin/bash

echo "Nodo kubernetes"

# see https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-join/
# see https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/
# altri spunti da https://jimmysong.io/en/posts/setting-up-a-kubernetes-cluster-with-vagrant/

# prendo da cartella condivisa lo script per il join del nodo al cluster e lo eseguo
cp /home/asw/_shared/resources/kubeadm_join_cmd.sh .
chmod +x kubeadm_join_cmd.sh
sh ./kubeadm_join_cmd.sh

# copio il file config in locale, per poter utilizzare il controllo di kubernetes (kubectl)
# come se fossi nodo master.

mkdir -p /home/vagrant/.kube
mkdir -p /root/.kube
cp /home/asw/_shared/resources/config /home/vagrant/.kube/config
cp /home/asw/_shared/resources/config /root/.kube/config