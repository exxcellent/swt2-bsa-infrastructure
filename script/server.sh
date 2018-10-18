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
echo "Pleas wait. Docker is starting..."
read -n 1 -s -r -p "Press any key to continue"

echo "==> Setup database..."
cd ..
script/step/clean-migrate-db $BACKEND_PROJECT_DB_DIRECTORY

# open browser message

# Press any key message
echo "Application ready! Open http://localhost"
read -n 1 -s -r -p "Press any key to continue"
