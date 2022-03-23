FROM python:latest

ENV MSG_PREFIX ""
ENV WHITE_LIST ""
# seconds
ENV CHECK_INTERVAL "300"

LABEL maintainer="Olatolu<https://www.oluolateru.com>"

USER root
WORKDIR /
COPY ./ /

RUN chmod o+x /*.sh && chmod o+x /*.py && \
    pip install -r requirements.txt && \
# Verify docker image
    pip show requests-unixsocket

ENTRYPOINT ["/monitor-docker-webhook.sh"]
