#!/bin/bash

# Exit on error. 
set -e

# Only run outside the container
if [ -e /.dockerenv ]
then
    echo 'Must be run outside container only'
    exit 1
fi

# Pull to check we are in sync and checked in.
git pull --rebase -s recursive -X ours origin gitdb-sqlite-docker

# Make sure a github password is supplied
GITHUB_PASSWORD=${1}
if [[ $GITHUB_PASSWORD == '' ]]
then
    echo 'Input github password: '
    read -s GITHUB_PASSWORD
fi

IMAGE_NAME='gitdb-sqlite-docker'

# Build the image.
docker build --build-arg GITHUB_PASSWORD=${GITHUB_PASSWORD} -t ${IMAGE_NAME} .

# Run the container.
docker run ${IMAGE_NAME}
