# Docker Swarm - Swarm e registry non sicuri

Secondo progetto, evoluzione del primo.

Il progetto risolve i bug presenti nel primo:

- Risoluzione del problema relativo al pacchetto java
- Adeguamento di docker alla nuova versione
- Adeguamento di gradle alla nuova versione
- Aggiornamento del sistema operativo (bento/ubuntu) all'ultima versione LTS (18.04)
- Sostituzione dell'immagine frolvlad/alpine-oraclejdk8 con la nuova frolvlad/alpine-java

Il progetto può essere avviato con vagrant up.

- Login ssh in macchina dev (vagrant ssh dev)
- ls ~/projects/02.insecure-swarm-insecure-registry
- ./build-all-projects.sh
- ./build-all-images.sh
- ./start-sentence-stack.sh

L'ambiente carica 3 nodi per lo swarm ed uno per il dev. Lo swarm non è sicuro (niente
crittografia). Lo stesso vale per il registry.