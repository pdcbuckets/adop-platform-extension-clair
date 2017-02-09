#!/bin/bash

echo "##### SETTING UP CLAIR ENVIRONMENT #####"
docker-compose -f docker-compose.yml up -d


echo "##### INSTALLING GO BINARIES ON JENKINS SLAVE #####"
# Install Go binaries
if [ ! -d /usr/local/go ]; then
	wget https://storage.googleapis.com/golang/go1.7.5.linux-amd64.tar.gz && \
	tar -C /usr/local -xzf go1.7.5.linux-amd64.tar.gz && \
	ln -s /usr/local/go/bin/go /usr/local/bin/ 
fi

echo "##### INSTALLING CLAIR ANALYZE TOOL ON JENKINS SLAVE #####"
# Get Clair Analyze tool
if [ ! -d /usr/local/tools/clair ]; then
	mkdir -p /usr/local/tools/clair && \
	export GOPATH=/usr/local/tools/clair && \
	go get -u github.com/coreos/clair/contrib/analyze-local-images && \
	ln -s /usr/local/tools/clair/bin/analyze-local-images /usr/local/bin
fi 
