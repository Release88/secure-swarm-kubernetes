# Kubernetes - Cluster sicuro e registry sicuro con credenziali

Sesto progetto, riguardante il gestore di container Kubernetes.

Tramite kubernetes, il cluster che viene creato è già in sicurezza (è una 
impostazione di default dello stesso gestore).

Stavolta il nodo master è swarm-3. A differenza di docker swarm, il nodo master
si occupa solo della gestione dei nodi: i pods (containers) verranno eseguito solo
sui due nodi "slave".

Il progetto può essere avviato con vagrant up.

- Login ssh in macchina dev (vagrant ssh dev)
- ls ~/projects/06.secure-project-secure-kubernetes
- ./build-all-projects.sh
- ./build-all-images.sh
- ./start-sentence-stack.sh

Questo ambiente riuscirà a salvare tutte le immagini create su registry (build-all-images.sh),
riuscirà a lanciare correttamente l'applicazione (tramite file di deployment eseguito in 
start-sentence-stack.sh) ed i vari pod verranno inizializzati ed eseguiti.
Non sarà però possibile visualizzare l'applicazione per una questione di porte e di networking interno
alla stessa, di cui ignoro le dinamiche.