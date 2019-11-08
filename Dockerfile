FROM artifactory.datapwn.com/tlnd-docker-prod/talend/common/tsbi/java8-base:1.8.0-20190910070805
MAINTAINER amarouni@talend.com

USER talend
ADD spark /opt/spark
