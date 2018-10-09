#!/bin/bash

UNLOCK_VERSION=${UNLOCK_VERSION:-$(awk -F \' '{if($1="__version__ ="){print $2;exit}}' unlocker/__init__.py)}

if [ ! -z ${UNLOCK_VERSION} ]
then
	echo "[$0] No image version specified not obtained from source. Set UNLOCK_VERSION env var to build this"
	exit 1
fi

if [ ! -z $1 ]
then
	docker build . -t $1/ssh-unlock:${UNLOCK_VERSION}
else
	docker build . -t ssh-unlock:${UNLOCK_VERSION}
fi
