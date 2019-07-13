#!/bin/bash

# tool utilizzato per la conversione dei files docker compose in
# files per il deploy in kubernetes.
# NON FA PARTE DEL PROVISIONING: utilizzato per ottenere la struttura
# principale del file di deploy di sentence-stack. 
# Da tenere in considerazione
# see http://kompose.io/getting-started/

curl -L https://github.com/kubernetes/kompose/releases/download/v1.17.0/kompose-linux-amd64 -o kompose

chmod +x kompose

mv ./kompose /usr/local/bin/kompose