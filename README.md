# EventFlow Processor Samples

Sample containers showing data stream processing for the CloudEvent Flow.
The [EventFlow](https://github.com/project-streamzi/eventflow) application is required to run these samples.

## Building the Linux Container image

Each java project is build via standard maven project:

```bash
mvn clean package
```

## Registration of the Stream Processor

The Stream Processors are deployed as Kubernetes Custom Resources. Each processor sample has a `.yml` file inside the `src/main/resources` folder, which you need apply to our cluster, like:

```bash
$ oc create -f data-processor/src/main/resources/processor-cr.yml
```

