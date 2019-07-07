# Docker Swarm - Swarm sicuro e registry sicuro con credenziali

Quinto progetto, evoluzione del quarto.

Il progetto mette in sicurezza ulteriormente il registry rendendo obbligatorio il login
con nome utente e password per ogni host che vuole effettuare un push o un pull di immagini.

Il progetto può essere avviato con vagrant up.

- Login ssh in macchina dev (vagrant ssh dev)
- ls ~/projects/04.secure-project-secure-swarm (lo stesso del progetto 4: sono compatibili)
- ./build-all-projects.sh
- ./build-all-images.sh
- ./start-sentence-stack.sh

L'ambiente carica 3 nodi per lo swarm ed uno per il dev. Lo swarm è sicuro. Il registry è sicuro
e protetto da credenziali impostate nel file common.sh