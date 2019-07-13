#!/bin/bash

# https://docs.docker.com/registry/deploying/
# integrazione della protezione da https://docs.docker.com/engine/security/https/

echo 'Starting private registry as a service -> my-registry:5000' 

# nell'ambiente docker-swarm, il registry puo' essere acceduto su my-registry:5000 
# my-registry e' un alias per swarm-1
# inoltre, anche my-swarm e' un alias per swarm-1 

# si assicura che la cartella /home/asw/data/my-registry sia stata creata 

mkdir -p /home/asw/data/my-registry

docker service create --name my-registry \
                      --publish 5000:5000 \
					  --restart-condition on-failure \
					  --mount type=bind,src=/home/asw/data/my-registry,dst=/var/lib/registry \
					  registry:2 