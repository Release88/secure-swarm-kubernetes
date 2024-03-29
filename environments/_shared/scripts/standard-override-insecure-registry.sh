#!/bin/bash

source "/home/asw/_shared/scripts/common.sh"

# impostazione dell'override.conf ereditata dal progetto iniziale

#
# copia il file OVERRIDE.CONF per sovrascrivere la configurazione di docker 
# - abilita la comunicazione remota della macchina dev
# - abilita my-registry come registry insicuro 
# - abilita la protezione tramite crittografia

mkdir -p /etc/systemd/system/docker.service.d
cp ${ASW_RESOURCES}/docker.service.d/override-dev-insecure-registry.conf /etc/systemd/system/docker.service.d/override.conf
chmod a-x /etc/systemd/system/docker.service.d/override.conf