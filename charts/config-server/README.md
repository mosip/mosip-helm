# Config Server

Helm chart for installing for Config Server.

## Install

```console
$ helm repo add mosip https://mosip.github.io
$ helm install my-release mosip/config-server
```

## Add New Placeholder

* To add a new placeholder, we have to define it in the `_overides.tpl` file.
* In `overrides` section of `values.yaml`, add configmap or secret name in which new placeholder's value is defined.
  ```
  overrides:
    secrets:
       secretName: <secret-name>

    configmaps:
       configmapName: <configmap-name>
  ```
* Based upon new secrets or configmaps added, add respective section in  `_overides.tpl` file.   <br>
  `<key-name>`: is the actual keyname for new placeholder's value added in configmap/secrets. <br>
  `<PLACEHOLDER_NAME>`: is referred as `placeholder.name` by config-server in property files. <br>
  
  Example for new value in configmap:
  ```
  - name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_<PLACEHOLDER_NAME>
    valueFrom:
      configMapKeyRef:
        name: {{ .Values.overrides.configmaps.configmapName }}
        key: <key-name>
  ```
  Example for new value in secret:
  ```
  - name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_<PLACEHOLDER_NAME>
    valueFrom:
      secretKeyRef:
        name: {{ .Values.overrides.secrets.secretName }}
        key: <key-name>
  ```