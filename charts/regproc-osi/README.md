# Operator, Supervisor, Introducer (OSI) Validator 

Helm chart for installing Registration Processor OSI Validator stage.

## Install
```console
$ kubectl create namespace regproc
$ helm repo add mosip https://mosip.github.io
$ helm -n regproc install my-release mosip/regproc-osi
```

