#!/bin/bash

# see https://docs.docker.com/registry/insecure/


# inserimento del nuovo file daemon.json nel quale può essere impostato
# l'indirizzo del registry non sicuro


mkdir -p /etc/docker
printf '{ "insecure-registries":["my-registry:5000"] }' > /etc/docker/daemon.json

systemctl daemon-reload
systemctl restart docker