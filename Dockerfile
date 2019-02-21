FROM openjdk:8u171-jre-alpine
MAINTAINER amarouni@talend.com

RUN apk update \
	&& apk add bash \
	&& apk add curl \
	&& apk add ca-certificates wget \
	&& update-ca-certificates \
	&& apk add openssl \
	&& apk add libc6-compat \
	&& apk add krb5

ADD spark /opt/spark
