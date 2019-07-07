# Docker Swarm - Swarm sicuro e registry sicuro

Quarto progetto, evoluzione del terzo.

Il progetto mette in sicurezza il registry tramite chiavi SSH e lo protegge con
crittografia SSL/TLS.

Il progetto può essere avviato con vagrant up.

- Login ssh in macchina dev (vagrant ssh dev)
- ls ~/projects/04.secure-project-secure-swarm
- ./build-all-projects.sh
- ./build-all-images.sh
- ./start-sentence-stack.sh

L'ambiente carica 3 nodi per lo swarm ed uno per il dev. Lo swarm è sicuro. Il registry è sicuro.