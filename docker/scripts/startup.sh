#!/bin/bash
export APP_BASE_PATH=/var/www/devflow

# Include main utility commands
source "${APP_BASE_PATH}/docker/scripts/docker-cmd.sh"
docker_cmd build_all
