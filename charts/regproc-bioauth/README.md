# Biometric Authentication

Helm chart for installing Registration Processor Biometric Authentication stage.

## Install
```console
$ kubectl create namespace regproc
$ helm repo add mosip https://mosip.github.io
$ helm -n regproc install my-release mosip/regproc-bioauth
```

