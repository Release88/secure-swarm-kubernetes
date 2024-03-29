#!/bin/bash

source "/home/asw/_shared/scripts/common.sh"

# see https://docs.docker.com/registry/configuration/

# generazione di certificati

export CERTS_PATH=${ASW_RESOURCES}/certs/registry
export SSL_SUBJECT=${SWARM_DOMAIN} 
export SSL_IP=${SSL_IP}
export SSL_DNS=${SSL_DNS}

export CA_EXPIRE=730
export SSL_EXPIRE=730

source "/home/asw/_shared/scripts/generate-certs.sh"