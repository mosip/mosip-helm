# pms migration utility

Helm chart for installing pms-migration-utility.

## TL;DR

```console
$ helm repo add mosip https://mosip.github.io
$ helm install my-release mosip/pms-migration-utility
```
## Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling