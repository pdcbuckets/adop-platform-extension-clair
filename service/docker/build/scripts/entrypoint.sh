#!/bin/bash
set -e

sed -i "s|###POSTGRES_URL###|$POSTGRES_URL|g" /resources/config.yaml

cp /resources/config.yaml /config/config.yaml

clair -config /config/config.yaml
