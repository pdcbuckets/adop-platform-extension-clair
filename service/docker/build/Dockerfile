FROM quay.io/coreos/clair

RUN mkdir -p /resources/

COPY scripts/entrypoint.sh /entrypoint.sh
COPY resources/config.yaml /resources/config.yaml

entrypoint ["/entrypoint.sh"]
