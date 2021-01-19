
FROM artifactory.datapwn.com/tlnd-docker-prod/talend/common/tsbi/python36-base:1.8.0-20190910070805 AS python3

FROM artifactory.datapwn.com/tlnd-docker-prod/talend/common/tsbi/java8-base:1.8.0-20190910070805

COPY --from=python3 /usr/lib64/ /usr/lib64/
COPY --from=python3 /usr/lib/ /usr/lib/
COPY --from=python3 /usr/bin/ /usr/bin/

USER talend
ADD spark /opt/spark