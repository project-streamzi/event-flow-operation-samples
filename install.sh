#!/usr/bin/env bash

echo "Installing event-flow samples"

oc create -f https://raw.githubusercontent.com/project-streamzi/event-flow-operation-samples/master/data-source/src/main/resources/source-cr.yml
oc create -f https://raw.githubusercontent.com/project-streamzi/event-flow-operation-samples/master/data-processor/src/main/resources/processor-cr.yml
oc create -f https://raw.githubusercontent.com/project-streamzi/event-flow-operation-samples/master/data-sink/src/main/resources/sink-cr.yml
