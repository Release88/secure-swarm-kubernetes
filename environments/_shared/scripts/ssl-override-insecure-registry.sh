#!/bin/bash

source "/home/asw/_shared/scripts/common.sh"

# impostazione dell'override.conf ereditata dal progetto iniziale
# integrazione della protezione da https://docs.docker.com/engine/security/https/

#
# copia il file OVERRIDE.CONF per sovrascrivere la configurazione di docker 
# - abilita la comunicazione remota del nodo 
# - abilita my-registry:5000 come registry insicuro 
# - abilita la protezione tramite crittografia

mkdir -p /etc/systemd/system/docker.service.d
cp ${ASW_RESOURCES}/docker.service.d/override-ssl-insecure-registry.conf /etc/systemd/system/docker.service.d/override.conf
chmod a-x /etc/systemd/system/docker.service.d/override.conf
