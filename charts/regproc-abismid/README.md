# ABIS Middleware

Helm chart for installing Registration Processor ABIS Middleware stage.

## Install
```console
$ kubectl create namespace regproc
$ helm repo add mosip https://mosip.github.io
$ helm -n regproc install my-release mosip/regproc-abismid
```

