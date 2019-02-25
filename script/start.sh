#!/bin/sh

# Start Application

set -e
cd "$(dirname "$0")/.."

# Load configurationBE
source script/_config

# down docker
script/stop.sh

# start docker-compose
cd $DOCKER_DIRECTORY
echo "==> Build docker..."
docker-compose build --no-cache
echo "==> Up docker..."
docker-compose up
