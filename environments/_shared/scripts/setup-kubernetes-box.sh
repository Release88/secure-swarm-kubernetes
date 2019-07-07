#!/bin/bash


apt-get install -y apt-transport-https curl

# aggiungo il repository per l'installazinoe di kubernetes
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

# installo kubernetes
apt-get update
apt-get install -y kubelet kubeadm kubectl

# blocco l'aggiornamento del tool
apt-mark hold kubelet kubeadm kubectl

# l'applicativo kubelet richiede lo swapoff
swapoff -a

# setto lo swapoff anche per il post reboot
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

# risolvo l'ip della macchina attuale
IP_ADDR=`ifconfig eth1 | grep inet | awk '{print $2}'| cut -f2 -d:`

# creo il file /etc/default/kubelet , se inesistente
if [[ ! -e /etc/default/kubelet ]]; then
    touch /etc/default/kubelet
fi

# aggiungo informazioni aggiuntive per consentire la creazione corretta del cluster
echo -e "KUBELET_EXTRA_ARGS=--node-ip=$IP_ADDR --cgroup-driver=cgroupfs" >> /etc/default/kubelet

sudo systemctl restart kubelet
cp -r /etc/docker/certs.d/my-registry\:5000 /etc/docker/certs.d/my-registry\:30500