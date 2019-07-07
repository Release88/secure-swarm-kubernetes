#!/bin/bash

source "/home/asw/_shared/scripts/common.sh"

# REGISTRY_SSL_PATH corrisponde al percorso alla cartella: 
# /etc/docker/certs.d/my-registry:5000
# come indicato dalla documentazione di docker
# copia i certificati nella destinazione indicata, affinchè
# il client possa accedere al registry.

mkdir -p ${REGISTRY_SSL_PATH}
# Copio i certificati per accedere al registry protetto
cp ${CERTS_PATH}/registry/cert.pem ${REGISTRY_SSL_PATH}/client.cert
cp ${CERTS_PATH}/registry/key.pem ${REGISTRY_SSL_PATH}/client.key
cp ${CERTS_PATH}/registry/ca.pem ${REGISTRY_SSL_PATH}/ca.crt