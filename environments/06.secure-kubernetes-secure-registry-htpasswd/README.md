# Kubernetes 

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

