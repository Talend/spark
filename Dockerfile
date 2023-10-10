FROM artifactory.datapwn.com/tlnd-docker-prod/talend/common/tsbi/java17-base:4.0.1-20230911145727

# Python3 settings, keeps in sync with https://github.com/Talend/data-processing-runtime/blob/main/project/PreviewRunnerService.scala#L31
USER root
ENV PYTHON_VERSION 3.6
RUN set -ex && yum install -y python3 python3-libs python3-devel python3-pip && pip install -U pip && yum clean all
USER talend

ADD spark /opt/spark
