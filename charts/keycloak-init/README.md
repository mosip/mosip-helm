# Keycloak Init

* Make sure Keycloak server is running
* Update server url and admin name/password in values.yml
* Update helm dependencies using:
```
$ helm dependency update
```
* Run the helm chart
```
$ helm install keycloak-init keycloak-init
```
