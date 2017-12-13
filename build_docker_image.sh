#!/bin/bash

if [ $# -eq 0 ]
then
	echo "Usage $0 1.6.2-talend-x"
	exit 1
fi

if [ -z "$1" ]
then
	echo "$1 is not a valid docker image tag"
	exit 1
fi

ARTIFACT_NAME=spark-*-bin-talend-spark.tgz
TEMP_FOLDER=spark
DOCKER_IMAGE_NAME=talend/spark
DOCKER_IMAGE_TAG=$1

## build spark targz
./make-distribution.sh --name talend-spark --tgz -Pyarn -Phadoop-2.7 -Dscala-2.11 -DskipTests

## remove example from targz
mkdir -p $TEMP_FOLDER
tar -xzvf $ARTIFACT_NAME -C $TEMP_FOLDER --strip-components 1
rm -rf spark/lib/spark-examples*

# build docker image
docker build -t $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG .

# clean up
rm -rf $ARTIFACT_NAME
rm -rf $TEMP_FOLDER
