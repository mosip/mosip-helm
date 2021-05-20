# Authmanager

Helm chart for installing MOSIP Admin module

## TL;DR

```console
$ helm repo add mosip https://mosip.github.io
$ helm install my-release mosip/admin
```

## Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling

## Installing the Chart

To install the chart with the release name `admin`.

```console
helm install my-release mosip/admin
```

The command deploys admin on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:


