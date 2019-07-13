#!/bin/bash

# see https://docs.docker.com/engine/security/certificates/

source "/home/asw/_shared/scripts/common.sh"


mkdir -p ${DOCKER_CERTS}/registry
# Copio i files necessari nella cartella creata
# questi files vengono posizionati in una specifica cartella che
# verrà richiamata al lancio del servizio del registry. La cartella verrà
# quindi montata all'interno del container del registry, affinchè possa essere
# protetto
cp ${CERTS_PATH}/registry/{cert,key,ca}.pem ${DOCKER_CERTS}/registry/