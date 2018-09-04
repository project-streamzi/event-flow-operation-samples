#!/bin/sh


if [ "$TRAVIS_PULL_REQUEST" != "false" ] ; then
    echo "Building Pull Request - nothing to push"
else
    echo "Login into Docker Hub ..."
    echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin docker.io

    docker build -t docker.io/streamziprocessors/cef-ops-log-data:latest log-data
    docker push docker.io/streamziprocessors/cef-ops-log-data:latest

    docker build -t docker.io/streamziprocessors/cef-ops-filter-data:latest filter-data
    docker push docker.io/streamziprocessors/cef-ops-filter-data:latest

    docker build -t docker.io/streamziprocessors/cef-ops-random-data:latest random-data
    docker push docker.io/streamziprocessors/cef-ops-random-data:latest

    docker build -t docker.io/streamziprocessors/cef-ops-node-filter-event-data:latest nodejs/filter-events
    docker push docker.io/streamziprocessors/cef-ops-node-filter-event-data:latest

    docker build -t docker.io/streamziprocessors/cef-ops-receiver:latest amqp/receiver
    docker push docker.io/streamziprocessors/cef-ops-receiver:latest

    docker build -t docker.io/streamziprocessors/cef-ops-sender:latest amqp/receiver
    docker push docker.io/streamziprocessors/cef-ops-sender:latest

fi
