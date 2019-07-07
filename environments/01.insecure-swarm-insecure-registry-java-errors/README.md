# Docker 

Progetto iniziale, clonato dal repository https://github.com/aswroma3/asw-2018

Questo progetto è la base da cui si è partiti per sviluppare le feature successive.

L'ambiente non funziona per errori relativi ai pacchetti di java e maven non più disponibili

Lo stesso vale per il progetto a cui questo ambiente fa riferimento (Progetto 01), il quale
possiede errori relativi al pull dell'immagine frolvlad/alpine-oraclejdk8 utilizzata da
tutti i moduli (eureka, sentence, word, zull), che non è più disponibile.


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

