#!/bin/bash

# https://docs.docker.com/registry/deploying/

echo 'Starting private registry as a service -> my-registry:5000' 

source "/home/asw/_shared/scripts/common.sh"

# nell'ambiente docker-swarm, il registry puo' essere acceduto su my-registry:5000 
# my-registry e' un alias per swarm-1
# inoltre, anche my-swarm e' un alias per swarm-1 

# my-registry:5000 e' abilitato come registry SICURO

# si assicura che la cartella /home/asw/data/my-registry sia stata creata 

mkdir -p /home/asw/data/my-registry

docker service create --name ${REGISTRY_DOMAIN} \
                      --publish 5000:5000 \
					  --restart-condition on-failure \
					  --mount type=bind,src=/home/asw/data/my-registry,dst=/var/lib/registry \
					  --mount type=bind,src=/home/vagrant/.docker/registry,dst=/certs \
					  --mount type=bind,src=/home/asw/_shared/resources/registry-config-no-passwd.yml,dst=/etc/docker/registry/config.yml \
					  registry:2 