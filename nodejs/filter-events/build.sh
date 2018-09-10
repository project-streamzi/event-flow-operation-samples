#!/bin/bash

echo 'Building Filter Events Processor'
docker build -t docker.io/streamziprocessors/cef-ops-node-filter-event-data .
docker tag docker.io/streamziprocessors/cef-ops-node-filter-event-data:latest docker.io/streamziprocessors/cef-ops-node-filter-event-data:latest
