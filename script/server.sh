#!/bin/sh

# Launch the application and any extra required processes locally.

set -e
cd "$(dirname "$0")/.."

# Load configurationBE
source script/_config

# ensure everything is up to date.
script/update.sh

# copy artefacts
# script/step/provide-angular-dist $FRONTEND_DIRECTORY $DOCKER_FRONTEND_DIRECTORY
# script/step/provide-jar-file $BACKEND_PROJECT_DIRECTORY $BACKEND_PROJECT_JAR_FILE $DOCKER_BACKEND_DIRECTORY

# start docker-compose
#echo "==> Starting docker..."
#cd $DOCKER_DIRECTORY
#docker-compose up --build -d
read -p "Press enter to continue"
