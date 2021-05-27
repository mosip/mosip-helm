# ID Keygen

Helm chart for running IDA keygen job.

## TL;DR

```console
$ helm repo add mosip https://mosip.github.io
$ helm -n ida install my-release mosip/ida-keygen
```

## Introduction

The helm chart here essentially contains job that generates encryption keys for IDA modules.  The job is to be run only once during initial install.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling

