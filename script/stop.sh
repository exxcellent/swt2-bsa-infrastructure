#!/bin/sh

# Stop Application

set -e
cd "$(dirname "$0")/.."

# Load configurationBE
source script/_config

# stop docker-compose
cd $DOCKER_DIRECTORY
echo "==> Down docker..."
docker-compose down