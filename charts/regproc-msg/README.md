# Message Sender

Helm chart for installing Registration Processor Message Sender stage.

## Install
```console
$ kubectl create namespace regproc
$ helm repo add mosip https://mosip.github.io
$ helm -n regproc install my-release mosip/regproc-msg
```

