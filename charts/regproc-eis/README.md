# External Integration Service

Helm chart for installing Registration Processor External Integration Service.

## Install
```console
$ kubectl create namespace regproc
$ helm repo add mosip https://mosip.github.io
$ helm -n regproc install my-release mosip/regproc-eis
```

