# Authmanager

Helm chart for installing MOSIP pmp reactJS UI module

## TL;DR

```console
$ helm repo add mosip https://mosip.github.io
$ helm install my-release mosip/pmp-reactjs-ui
```

## Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling

## Installing the Chart

To install the chart with the release name `pmp-reactjs-ui`.

```console
helm install my-release mosip/pmp-reactjs-ui
```

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:


