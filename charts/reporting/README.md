# Reporting Framework

Helm chart for installing reporting module

## TL;DR

```console
$ helm repo add mosip https://mosip.github.io/mosip-helm
$ helm install my-release mosip/reporting
```

## Contents

This helm chart contains the following subcharts and they can be individually configured/installed/omitted, through the `values.yaml`.
- Bitnami's Kafka
- Debezium Kafka Connector
- Elasticsearch Kafka Connector
- A KafkaClient Pod for monitoring kafka topics, and making connect api calls

