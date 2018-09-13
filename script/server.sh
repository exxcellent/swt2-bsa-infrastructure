#!/bin/sh

# Launch the application and any extra required processes locally.

set -e
cd "$(dirname "$0")/.."

# Load configurationBE
source script/_config

# ensure everything is up to date.
script/update.sh

# start docker-compose
echo "==> Starting docker..."
cd $DOCKER_DIRECTORY
docker-compose up --build -d

# migrate database

# open browser message

# Press any key message