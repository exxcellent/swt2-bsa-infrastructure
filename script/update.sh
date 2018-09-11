#!/bin/sh

# Update application to run for its current checkout.

set -e
cd "$(dirname "$0")/.."

# Load configurationBE
source script/_config

script/bootstrap.sh


echo "==> Pulling frontend..."
git -C $FRONTEND_DIRECTORY pull 

echo "==> Pulling backend..."
git -C $BACKEND_DIRECTORY pull 

#echo "==> Building frontend..."
#script/step/build-angular-application $FRONTEND_DIRECTORY
#echo "==> Building backend..."
#script/step/build-maven-application $BACKEND_DIRECTORY


#echo "==> Updating database..."

# run all database migrations to ensure everything is up to date.



