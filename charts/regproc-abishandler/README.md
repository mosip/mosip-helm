# ABIS Handler

Helm chart for installing Registration Processor ABIS Handler stage.

## Install
```console
$ kubectl create namespace regproc
$ helm repo add mosip https://mosip.github.io
$ helm -n regproc install my-release mosip/regproc-abishandler
```

