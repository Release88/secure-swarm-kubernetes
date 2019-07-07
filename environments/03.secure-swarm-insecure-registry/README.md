# Docker 

Terzo progetto, evoluzione del secondo.

Il progetto mette in sicurezza lo swarm tramite la generazione di chiavi SSH,
adeguando gli script che costruiscono e settano i nodi swarm e il nodo dev.

** In questo ambiente il registry non è ancora in sicurezza**
** Per questo motivo lo swarm non riuscirà ad effettuare il pull da registry non sicuro **
** Lo swarm sicuro ha bisogno di una connessione SSL/TLS verso il registry **

Il progetto può essere avviato con vagrant up.

- Login ssh in macchina dev (vagrant ssh dev)
- ls ~/projects/03.insecure-project-secure-swarm
- ./build-all-projects.sh
- ./build-all-images.sh
- ./start-sentence-stack.sh

All'avvio dello script start-sentence-stack ritornerà esito positivo. Ma lo stack non
risucirà a fare il pull delle immagini del registry e quindi l'applicativo non verrà avviato.

L'ambiente carica 3 nodi per lo swarm ed uno per il dev. Lo swarm è sicuro. Il registry è insicuro.


# OLD

Ambiente di esecuzione composto da un cluster (*swarm*) di nodi Docker, 
composto da tre macchine virtuali **swarm-1**, **swarm-2** e **swarm-3**. 

L'ambiente contiene anche un ulteriore nodo **dev** per lo sviluppatore, 
da utilizzare come client dello *swarm*. 

## Descrizione delle macchine virtuali 

Le macchine virtuali per i tre nodi dello *swarm* hanno la stessa struttura: 

### swarm-i

La macchina virtuale **swarm-i** (10.11.1.70+i) 
ha il seguente software 

* Ubuntu 16.04 LTS a 64 bit (by Bento)

* Docker 

* Docker Compose 

Configurazione di rete 

* Indirizzo IP: 10.11.1.70+i (per esempio, **swarm-i** ha l'indirizzo 10.11.1.71)

* Porte pubblicate sull'host: 8080 -> 8080+i (per esempio, **swarm-i** ha la porta 8080 pubblicata sulla porta 8081 dell'host)

* Alias: i nodi dello swarm sono visibili (tra di loro e dal client **dev**) anche con 
  i nomi simbolici **my-swarm** e **my-registry**
  
## Configurazione  
 
Non c'è nessuna configurazione manuale da fare. 
Lo *swarm* viene creato e avviato automaticamente al 
momento della creazione dell'ambiente (`vagrant up`). 

### dev

La macchina virtuale **dev** (10.11.1.81), 
da usare come nodo per lo sviluppatore e come client dello *swarm*, 
ha il seguente software 

* Ubuntu 16.04 LTS a 64 bit (by Bento)

* Docker e Docker Compose 

* Java, Gradle e Maven 

Configurazione di rete 

* Indirizzo IP: 10.11.1.81 

* Porte pubblicate sull'host: nessuna

* Alias: i nodi dello swarm sono visibili dal client **dev** anche con 
  i nomi simbolici **my-swarm** e **my-registry**

