#!/bin/sh

# Resolve all dependencies that the application requires to run.

set -e
cd "$(dirname "$0")/.."

# Load configurationBE
source script/_config

# All necessary tools have to be installed
echo "==> Checking tools..."

script/step/check-tools git "Git" https://git-scm.com/
script/step/check-tools mvn "Apache Maven" https://maven.apache.org/
script/step/check-tools node "Node.js" https://nodejs.org/
script/step/check-tools npm "Node Package Manager (NPM)" https://www.npmjs.com/get-npm
script/step/check-tools docker "Docker" https://www.docker.com/community-edition
script/step/check-tools docker-compose "Docker-Compose" https://docs.docker.com/compose/install/

# Set git config
echo "==> Configure git..."
git config --global core.autocrlf input
git config --global pull.rebase true

# Clone repositories
script/step/clone-repository $FRONTEND_REPOSITORY $FRONTEND_DIRECTORY
script/step/clone-repository $BACKEND_REPOSITORY $BACKEND_DIRECTORY

# Run npm install
script/step/install-node-packages $FRONTEND_DIRECTORY
