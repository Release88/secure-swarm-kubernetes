#!/bin/bash

echo "Nodo dev"
# apt-get install -y sshpass
# sshpass -p "vagrant" scp -o StrictHostKeyChecking=no vagrant@10.11.1.73:/home/vagrant/kubelet.conf .
# chown vagrant:vagrant /home/vagrant/kubelet.conf


mkdir -p /home/vagrant/.kube
mkdir -p /root/.kube

# copio il file salvato "config" in ~/.kube : mi consentirà di 
# usare "kubectl" come se fossi sempre il nodo master da qualsiasi macchina.
# Il file config è stato salvato dal nodo master e contiene le chiavi tramite le quali
# si può dialogare in modo protetto con l'api di del nodo master.

cp /home/asw/_shared/resources/config /home/vagrant/.kube/config
cp /home/asw/_shared/resources/config /root/.kube/config