# Datashare 

Helm chart for installing Datashare Service

## TL;DR

```console
$ helm repo add mosip https://mosip.github.io
$ helm -n datashare install my-release mosip/datashare
```

## Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling

