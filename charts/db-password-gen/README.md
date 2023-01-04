# db-password-gen

* Make sure Postgre server(s) are running
* Update all database parameters in `values.yaml`
* Add mosip helm repo
```
* Update helm dependencies using:
```
$ helm dependency update
```
* Run the helm chart
```
$ helm -n postgres install db-password-gen db-password-gen
```
