# Auditmanager

Helm chart for installing Pre-Registration Datasync service.

## TL;DR

```console
$ helm repo add mosip https://mosip.github.io
$ helm install my-release mosip/prereg-datasync
```
## Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling

## Installing the Chart

To install the chart with the release name `prereg-datasync`.

```console
helm install my-release mosip/prereg-datasync
```

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release
```

