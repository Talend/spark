ARTIFACT_NAME=spark-3.0.1-bin-talend-spark.tgz
TEMP_FOLDER=spark
DOCKER_IMAGE_NAME=talend/spark
DOCKER_IMAGE_TAG=3.0.1-tlnd

## build spark targz
./dev/make-distribution.sh --name talend-spark --tgz -Pyarn -Dscala-2.12 -DskipTests

## remove example from targz
mkdir -p $TEMP_FOLDER
tar -xzvf $ARTIFACT_NAME -C $TEMP_FOLDER --strip-components 1
rm -rf $TEMP_FOLDER/lib/spark-examples* $TEMP_FOLDER/data $TEMP_FOLDER/examples $TEMP_FOLDER/python

# build docker image
docker build -t $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG .

# clean up
rm -rf $ARTIFACT_NAME
rm -rf $TEMP_FOLDER