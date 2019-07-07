#!/bin/bash

source "/home/asw/_shared/scripts/common.sh"

# set up Java constants 
JAVA_VERSION=12
JAVA_MINOR_VERSION=0.1
JAVA_BUILD=12
JAVA_HEX=69cfe15208a647278a19ef0990eea691

# http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.tar.gz

# OLD VERSION
# JAVA_FILE_NAME=jdk-${JAVA_VERSION}u${JAVA_MINOR_VERSION}-linux-x64
# JAVA_ARCHIVE=${JAVA_FILE_NAME}.tar.gz
# GET_JAVA_URL=http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}u${JAVA_MINOR_VERSION}-b${JAVA_BUILD}/${JAVA_HEX}
# JAVA_JDK_PATH=/usr/local/jdk1.${JAVA_VERSION}.0_${JAVA_MINOR_VERSION} 
# e.g., /usr/local/jdk1.8.0_181


# NEW VERSION
JAVA_FILE_NAME=jdk-${JAVA_VERSION}.${JAVA_MINOR_VERSION}_linux-x64_bin
JAVA_ARCHIVE=${JAVA_FILE_NAME}.tar.gz
GET_JAVA_URL=http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}.${JAVA_MINOR_VERSION}+${JAVA_BUILD}/${JAVA_HEX}
JAVA_JDK_PATH=/usr/local/jdk-${JAVA_VERSION}.${JAVA_MINOR_VERSION}

echo ${GET_JAVA_URL};

JAVA_JRE_PATH=/usr/lib/jvm/jre 

function installLocalJava {
	echo "====================="
	echo "installing oracle jdk"
	echo "====================="
	FILE=${ASW_DOWNLOADS}/$JAVA_ARCHIVE
	tar -xzf $FILE -C /usr/local
}

function installRemoteJava {
	echo "======================"
	echo "downloading oracle jdk"
	echo "======================"
	wget -nv -P ${ASW_DOWNLOADS} --header "Cookie: oraclelicense=accept-securebackup-cookie;" "${GET_JAVA_URL}/${JAVA_ARCHIVE}" 
	installLocalJava 
}

function setupJava {
	echo "setting up java"
	if downloadExists $JAVA_ARCHIVE; then
		ln -s $JAVA_JDK_PATH /usr/local/java
	else
		ln -s $JAVA_JRE_PATH /usr/local/java
	fi
}

function setupEnvVars {
	echo "creating java environment variables"
	echo export JAVA_HOME=/usr/local/java >> /etc/profile.d/java.sh
	echo export PATH=\${JAVA_HOME}/bin:\${PATH} >> /etc/profile.d/java.sh
}

function installJava {
	if downloadExists $JAVA_ARCHIVE; then
		installLocalJava
	else
		installRemoteJava
	fi
}

echo "setup java"
installJava
setupJava
setupEnvVars
