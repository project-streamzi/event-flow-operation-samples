#!/bin/sh


if [ "$TRAVIS_PULL_REQUEST" != "false" ] ; then
    echo "Building Pull Request - nothing to push"
else
    echo "Login into Docker Hub ..."
    echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin docker.io

## Push the Java images, created in the maven build;
    docker push docker.io/streamziprocessors/cef-ops-log-data:latest

    docker push docker.io/streamziprocessors/cef-ops-filter-data:latest

    docker push docker.io/streamziprocessors/cef-ops-random-data:latest

    docker push docker.io/streamziprocessors/cef-ops-receiver:latest

    docker push docker.io/streamziprocessors/cef-ops-sender:latest

## Build and Push the Node image;
    docker build -t docker.io/streamziprocessors/cef-ops-node-filter-event-data:latest nodejs/filter-events
    docker push docker.io/streamziprocessors/cef-ops-node-filter-event-data:latest

fi
