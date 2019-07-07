# Docker Swarm - Swarm sicuro e registry non sicuro

Terzo progetto, evoluzione del secondo.

Il progetto mette in sicurezza lo swarm tramite la generazione di chiavi SSH,
adeguando gli script che costruiscono e settano i nodi swarm e il nodo dev.

** In questo ambiente il registry non è ancora in sicurezza**
** Per questo motivo non si riuscirà ad effettuare il pull sull registry, che pretenderà connessione SSL/TLS **
** Lo swarm sicuro ha bisogno di una connessione SSL/TLS verso il registry **

Il progetto può essere avviato con vagrant up.

- Login ssh in macchina dev (vagrant ssh dev)
- ls ~/projects/03.insecure-project-secure-swarm
- ./build-all-projects.sh
- ./build-all-images.sh
- ./start-sentence-stack.sh

Verrà generato errore durante build-all-images.sh, poiché:

** Get https://my-registry:5000/v2/: http: server gave HTTP response to HTTPS client **

L'ambiente carica 3 nodi per lo swarm ed uno per il dev. Lo swarm è sicuro. Il registry è insicuro.