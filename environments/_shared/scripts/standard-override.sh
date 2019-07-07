#!/bin/bash

source "/home/asw/_shared/scripts/common.sh"

#
# copia il file OVERRIDE.CONF per sovrascrivere la configurazione di docker 
# - abilita la comunicazione remota della macchina dev
# - abilita my-registry come registry sicuro
# - abilita la protezione tramite crittografia

mkdir -p /etc/systemd/system/docker.service.d
cp ${ASW_RESOURCES}/docker.service.d/override-dev.conf /etc/systemd/system/docker.service.d/override.conf
chmod a-x /etc/systemd/system/docker.service.d/override.conf