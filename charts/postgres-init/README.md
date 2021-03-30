# Postgres Init

* Make sure Postgre server(s) are running
* Update all database parameters in `values.yaml`
* Add mosip helm repo
```
$ helm repo add mosip https://mosip.github.io/mosip-helm
* Update helm dependencies using:
```
$ helm dependency update
```
* Run the helm chart
```
$ helm install postgres-init postgres-init
```
