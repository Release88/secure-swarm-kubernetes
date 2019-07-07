#!/bin/bash

# dove vengono montate le risorse e i download condivisi
 
ASW_HOME=/home/asw 
ASW_DOWNLOADS=${ASW_HOME}/_shared/downloads
ASW_RESOURCES=${ASW_HOME}/_shared/resources

# dalla versione 3
HOME_PATH=/home/vagrant
CERTS_PATH=${ASW_RESOURCES}/certs
DOCKER_CERTS=${HOME_PATH}/.docker
STARTING_IP=${STARTING_IP}
REGISTRY_DOMAIN=${REGISTRY_DOMAIN}
SWARM_DOMAIN=${SWARM_DOMAIN}
SWARM_NODE_PREFIX=${SWARM_NODE_PREFIX}
SSL_DNS=${SSL_DNS}
SSL_IP=${SSL_IP}
SSL_SUBJECT=${SWARM_DOMAIN}


# dalla versione 4
REGISTRY_SSL_PATH=/etc/docker/certs.d/my-registry:5000

# dalla versione 5
REGISTRY_USER=uniroma3
REGISTRY_PASSWORD=5eCur3-r3gistrY

# funzioni valide per tutti
function resourceExists {
	FILE=${ASW_RESOURCES}/$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}

function downloadExists {
	FILE=${ASW_DOWNLOADS}/$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}

function fileExists {
	FILE=$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}

#echo "common loaded"