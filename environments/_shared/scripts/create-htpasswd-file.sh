#!/bin/bash

# see https://docs.docker.com/registry/configuration/
# see https://medium.com/@lvthillo/deploy-a-docker-registry-using-tls-and-htpasswd-56dd57a1215a

source "/home/asw/_shared/scripts/common.sh"

mkdir -p /home/asw/data/my-registry

# crea il file htpasswd che verrà montato nel registry per assicurarne la protezione

docker run --name temp-registry \
        --entrypoint htpasswd  registry:2 \
		-Bbn ${REGISTRY_USER} ${REGISTRY_PASSWORD} > /home/asw/_shared/resources/htpasswd