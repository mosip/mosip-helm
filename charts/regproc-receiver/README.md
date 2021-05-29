# Packet Receiver

Helm chart for installing RegProc Packet Receiver stage.  This stage will be public facing as it is expected to receive packets from registration clients.

## TL;DR

```console
$ helm repo add mosip https://mosip.github.io
$ helm install my-release mosip/regproc-receiver
```
## Persistence
Static proivisioning of the landing folder has been done as the folder should not get deleted and must be accessible on restart of the pods/cluster. The annotation `"helm.sh/resource-policy": keep` has been applied in `pv.yaml` to make sure helm does not delete PV.  This is required as packet servers PVC would be bound to this PV. 

## Prerequisites

- Kubernetes 1.12+
- Helm 3.1.0
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling

