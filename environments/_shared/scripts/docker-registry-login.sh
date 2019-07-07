#!/bin/bash

source "/home/asw/_shared/scripts/common.sh"

# effettua il login al registry protetto da password
# nome utente e password vengono impostati nel file common.sh

docker login -u ${REGISTRY_USER} -p ${REGISTRY_PASSWORD} my-registry:5000


# visto che il login, in fase di avvio delle macchine, viene effettuato dall'utente
# root, copio il file che viene generato dopo il login (contenente i token di accesso
# al registry) nella stessa cartella riferita all'utente vagrant.

cp /root/.docker/config.json /home/vagrant/.docker/config.json
chown -R vagrant:vagrant /home/vagrant/.docker