#!/bin/bash

echo 'Building Filter Events Processor'
docker build -t docker.io/streamziprocessors/node-data-processor .
docker tag docker.io/streamziprocessors/node-data-processor:latest docker.io/streamziprocessors/node-data-processor:latest
