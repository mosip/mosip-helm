# MOSIP Helm Charts

## Overview
Helm charts for all MOSIP services. The charts here are published in `gh-pages` branch of this repo. To install the charts add the respository as below:

```
helm repo add mosip https://mosip.github.io/mosip-helm
```

## Publish charts manually
* In the branch where changes have been made run the following from `mosip-helm` folder
```
helm package charts/<chart name>
```
* You will see packaged `.tgz` files created in current directory.
* Copy the `.tgz` files to `gh-pages` branch of `mosip-helm` repo. You can clone another copy of the repo and check out `gh-pages` branch to achieve this.
* Run 
```
./publish.sh
```

## License
This project is licensed under the terms of [Mozilla Public License 2.0](LICENSE).

