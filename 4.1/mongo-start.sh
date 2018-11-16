#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

echo ${MONGODB_KEYFILE_VALUE} > /tmp/keyfile
chmod 0600 /tmp/keyfile

mongod --dbpath /data/db --replSet ${MONGODB_REPLICA_NAME} --sslMode requireSSL --sslPEMKeyFile /opt/mongo-ssl/mongodb.pem --sslCAFile /opt/mongo-ssl/ca.pem --sslAllowConnectionsWithoutCertificates --keyFile /tmp/keyfile --bind_ip_all
