
FROM artifactory.datapwn.com/tlnd-docker-prod/talend/common/tsbi/python36-base:2.6.1-20210216075731 AS python3

FROM artifactory.datapwn.com/tlnd-docker-prod/talend/common/tsbi/java8-base:2.6.1-20210216075731

COPY --from=python3 /usr/lib64/ /usr/lib64/
COPY --from=python3 /usr/lib/ /usr/lib/
COPY --from=python3 /usr/bin/ /usr/bin/

USER talend
ADD spark /opt/spark
