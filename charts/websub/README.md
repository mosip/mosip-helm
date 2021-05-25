# Websub

Helm chart for installing Websub module.  The module is generally external facing for other partners to connect a receive events.

## TL;DR

```console
$ helm repo add mosip https://mosip.github.io
$ helm install my-release mosip/websub
```
## Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling

