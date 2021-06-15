# Print Service

Helm chart for installing sample Print service module. This is a reference implementation that needs to be customized by a country.

## Install

```console
$ helm repo add mosip https://mosip.github.io
$ helm install my-release mosip/print-service
```
## Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling

