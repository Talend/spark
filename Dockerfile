FROM artifactory.datapwn.com/tlnd-docker-prod/talend/common/tsbi/java8-base:1.8.0-20190910070805
MAINTAINER amarouni@talend.com

USER root
RUN set -ex \
    && yum install -y python3 \
        python3-libs \
        python3-devel \
        python3-pip \
    && yum clean all \ 
    && rm -rf /var/cache/yum
RUN pip3.6 install -U pip
USER talend
ADD spark /opt/spark
