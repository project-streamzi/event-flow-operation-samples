#!/usr/bin/env bash

echo "Installing event-flow samples"

oc create -f https://raw.githubusercontent.com/project-streamzi/event-flow-operation-samples/master/random-data/src/main/resources/random-data-cr.yml
oc create -f https://raw.githubusercontent.com/project-streamzi/event-flow-operation-samples/master/filter-data/src/main/resources/filter-data-cr.yml
oc create -f https://raw.githubusercontent.com/project-streamzi/event-flow-operation-samples/master/log-data/src/main/resources/log-data-cr.yml
