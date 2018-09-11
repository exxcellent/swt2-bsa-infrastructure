#!/bin/sh

# Remove all project and development data.
# Local changes will be lost.
#
# Starts the server with the latest repository version.

set -e
cd "$(dirname "$0")/.."

script/step/clear-all

#script/server.sh