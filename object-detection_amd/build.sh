#!/bin/sh

branch_name=$(git rev-parse --abbrev-ref HEAD)
docker build -t felice/object-detection:${branch_name} . --build-arg CONTAINER_VERSION=${branch_name}
