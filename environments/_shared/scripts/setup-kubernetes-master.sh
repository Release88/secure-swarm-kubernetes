#!/bin/bash

echo "Nodo master"

IP_ADDR=`ifconfig eth1 | grep inet | awk '{print $2}'| cut -f2 -d:`
HOST_NAME=$(hostname -s)

# avvio il cluster
# see https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-init/
# see https://www.mankier.com/1/kubeadm-init
kubeadm init --apiserver-advertise-address=$IP_ADDR --apiserver-cert-extra-sans=$IP_ADDR  --node-name $HOST_NAME --pod-network-cidr=192.168.0.0/16

# copio il file config anche per l'utente "vagrant"
# see https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/
sudo --user=vagrant mkdir -p /home/vagrant/.kube
mkdir -p /root/.kube
cp -i /etc/kubernetes/admin.conf /home/vagrant/.kube/config
cp -i /etc/kubernetes/admin.conf /root/.kube/config
chown $(id -u vagrant):$(id -g vagrant) /home/vagrant/.kube/config

export KUBECONFIG=/etc/kubernetes/admin.conf

# avvio il controller di rete Calico che si occupa della sicurezza del cluster
# see https://docs.projectcalico.org/v3.7/introduction/
kubectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
kubectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml

# creo il comando con token necessario per la connessione degli altri nodi al cluster
# see https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-token/
kubeadm token create --print-join-command >> /etc/kubeadm_join_cmd.sh

# salvo il comando in cartella condivisa, così da poterlo richiamare
cp /etc/kubeadm_join_cmd.sh /home/asw/_shared/resources/kubeadm_join_cmd.sh
chmod +x /home/asw/_shared/resources/kubeadm_join_cmd.sh


# sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
# sudo service sshd restart

# salvo il file config in cartella condivisa, così da settarlo in tutte 
# le altre macchine (dev compresa). Tramite questo file si potrà usare il tool
# kubectl per dialogare direttamente con il nodo master (tramite l'api del nodo master)
cp /home/vagrant/.kube/config /home/asw/_shared/resources/config