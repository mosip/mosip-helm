# pms-115-120 migration utility

Helm chart for installing pms-115-120.

## TL;DR

```console
$ helm repo add mosip https://mosip.github.io
$ helm install my-release mosip/pms-partner
```
## Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling