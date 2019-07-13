#!/bin/bash

source "/home/asw/_shared/scripts/common.sh"

# see https://docs.docker.com/engine/security/https/


# Creo la cartella in cui salvare i certificati
mkdir -p ${DOCKER_CERTS}

# DOCKER_CERTS corrisponde al percorso alla cartella: 
# ~/.docker/
# come indicato dalla documentazione di docker
# copia i certificati nella destinazione indicata, affinchè
# il client possa dialogare con lo swarm

# Copio i certificati
cp ${CERTS_PATH}/{ca,cert,key}.pem ${DOCKER_CERTS}/
