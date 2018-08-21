#!/bin/bash

echo 'Building CONTAINER'
docker build -t docker.io/streamziprocessors/cef-ops-node-filter-event-data .
docker tag docker.io/streamziprocessors/cef-ops-node-filter-event-data:latest 1docker.io/streamziprocessors/cef-ops-node-filter-event-data:latest
docker push docker.io/streamziprocessors/cef-ops-node-filter-event-data:latest
