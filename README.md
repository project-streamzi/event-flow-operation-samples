# Event Flow Operations/Processors

Sample containers showing data stream processing for the CloudEvent Flow.
The [CloudEventFlow](https://github.com/project-streamzi/cloudevent-flow) application is required to run these samples.

# Registration

The Stream Processors are deployed as Kubernetes Custom Resources.
To deploy them run the following commands:

```bash
$ oc create -f random-data/random-data-cr.yml
$ oc create -f log-data/lod-data-cr.yml
$ oc create -f amqp/receiver/ampq-receiver-cr.yml
$ oc create -f amqp/sender/amqp-sender-cr.yml 
$ oc create -f nodejs/filter-events/filter-data-cr.yml 
```

# Building / Development

Run the following commands to build and update running processors

```bash
$ cd random-data
$ mvn clean package
$ docker build -t docker.io/streamziprocessors/cef-ops-random-data:latest .
$ oc delete pod <name-of-random-data-pod>
```

TODO: Script to build/deploy all operations?

TODO: how to deploy the Node.js operations?
