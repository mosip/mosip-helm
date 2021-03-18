# Postgres Init

* Make sure Postgre server(s) are running
* Update all database parameters in `values.yaml`
* Update helm dependencies using:
```
$ helm dependency update
```
* Run the helm chart
```
$ helm install postgres-init postgres-init
```
