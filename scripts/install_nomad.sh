#!/bin/bash

set -ex

NOMAD_VERSION="0.5.0"
CURDIR=`pwd`

echo Fetching Nomad ${NOMAD_VERSION} ...

cd /tmp/
curl -sSL https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip -o nomad.zip
echo Installing Nomad ...
unzip nomad.zip
sudo chmod +x nomad
sudo mv nomad /usr/bin/nomad

sudo mkdir -p /etc/nomad.d
sudo chmod a+w /etc/nomad.d

# This is very important as this script may be used in some workflow
# The directory of the workflow should not be modified by individual scripts
cd ${CURDIR}