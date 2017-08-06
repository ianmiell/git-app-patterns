#!/bin/bash

# Exit on error. 
set -e

echo Input GitHub password
read -s GITHUB_PASSWORD

IMAGE_NAME='gitdb-sqlite-docker'

# Build the image.
docker build --no-cache --build-arg GITHUB_PASSWORD=${GITHUB_PASSWORD} -t ${IMAGE_NAME} .

# Run the container.
docker run ${IMAGE_NAME}
