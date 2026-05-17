# MOSIP Helm Charts

[![License: MPL 2.0](https://img.shields.io/badge/License-MPL_2.0-brightgreen.svg)](https://opensource.org/licenses/MPL-2.0)
[![Helm](https://img.shields.io/badge/Helm-3.x-blue?logo=helm)](https://helm.sh/)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-1.21+-blue?logo=kubernetes)](https://kubernetes.io/)

Helm charts for all [MOSIP](https://mosip.io/) services. Charts are published to the `gh-pages` branch of this repository and served via GitHub Pages.

---

## Overview

[MOSIP (Modular Open Source Identity Platform)](https://mosip.io/) is an open-source platform that helps governments build foundational digital identity systems. This repository contains production-grade Helm charts for deploying all MOSIP modules on a Kubernetes cluster.

This repo is one of three core deployment repositories:

| Repository | Purpose |
|---|---|
| `mosip-helm` | Packaged Helm charts for all MOSIP modules |
| `mosip-infra` | Deployment scripts to run charts in sequence |
| `mosip-config` | Configuration files required by MOSIP modules |

---

## Prerequisites

Before using these charts, make sure you have the following installed:

- **kubectl** >= 1.21
- **Helm** >= 3.x
- A running Kubernetes cluster
- `bitnami` Helm repo added (used by several MOSIP dependencies):

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
```

---

## Adding the MOSIP Helm Repository

```bash
helm repo add mosip https://mosip.github.io/mosip-helm
helm repo update
```

---

## Installing a Chart

```bash
helm install <release-name> mosip/<chart-name> \
  --namespace <namespace> \
  --create-namespace \
  -f <your-values.yaml>
```

Example:

```bash
helm install admin-hotlist mosip/admin-hotlist \
  --namespace mosip \
  --create-namespace
```

---

## Upgrading a Chart

```bash
helm upgrade <release-name> mosip/<chart-name> \
  --namespace <namespace> \
  -f <your-values.yaml>
```

---

## Publishing Charts Manually

If you've made changes to a chart and need to publish it manually:

**1. Package the chart:**

```bash
# Run from the mosip-helm root folder
helm package charts/<chart-name>
```

You will see a `.tgz` file created in the current directory.

**2. Copy to `gh-pages` branch:**

Clone the repo again in a separate directory and check out `gh-pages`:

```bash
git clone https://github.com/mosip/mosip-helm.git mosip-helm-pages
cd mosip-helm-pages
git checkout gh-pages
```

Copy the `.tgz` file into this directory.

**3. Publish:**

```bash
./publish.sh
```

> Charts are automatically published via GitHub Actions on every merged PR. Manual publishing is only needed for exceptional cases.

---

## Linting Charts

### Lint all charts

```bash
CONFIG_FILE='.github/chart-testing-config.yaml'
CHART_DIR='charts'
TARGET_ORIGIN='origin'
TARGET_BRANCH='gh-pages'
LOG_FILE="./helm-lint-$CHART_DIR.log"

ct lint --config=$CONFIG_FILE \
  --chart-dirs=$CHART_DIR \
  --remote=$TARGET_ORIGIN \
  --target-branch=master
```

### Lint a specific chart

```bash
CONFIG_FILE='.github/chart-testing-config.yaml'
CHART_DIR='charts/admin-hotlist'
TARGET_ORIGIN='origin'

ct lint --config=$CONFIG_FILE \
  --charts=$CHART_DIR \
  --remote=$TARGET_ORIGIN \
  --target-branch=master
```

---

## YAML Formatting Conventions

When editing chart YAML files, apply these formatting rules to stay consistent:

```bash
# Remove trailing spaces
sed -i 's/\s*$//g' <path/to/yaml/file>

# Remove extra spaces after ": "
sed -i 's/:\s\s*/: /g' <path/to/yaml/file>

# Remove extra spaces after "- "
sed -i 's/-\s\s*/- /g' <path/to/yaml/file>

# Remove empty lines from beginning and end
sed -i -e '/./,$!d' -e :a -e '/^\n*$/{$d;N;ba' -e '}' <path/to/yaml/file>
```

---

## CI/CD

Chart validation and publishing is automated via GitHub Actions. On every pull request, the workflow:

1. Lints all modified charts using `chart-testing`
2. Validates chart YAML against the health check schema
3. Publishes updated charts to `gh-pages` on merge

The workflow file lives at `.github/workflows/`.

---

## Contributing

1. Fork the repository
2. Create a branch: `git checkout -b feat/your-chart-change`
3. Make your changes and run `helm lint charts/<chart-name>` locally
4. Open a Pull Request against the `master` branch

Please follow the YAML formatting conventions above before opening a PR.

---

## Related Repositories

- [mosip/mosip-infra](https://github.com/mosip/mosip-infra) - Deployment scripts and Kubernetes cluster setup
- [mosip/mosip-config](https://github.com/mosip/mosip-config) - MOSIP module configuration files
- [mosip/k8s-infra](https://github.com/mosip/k8s-infra) - Kubernetes infrastructure for MOSIP

---

## Community & Support

- 🌐 [MOSIP Website](https://mosip.io/)
- 📚 [MOSIP Documentation](https://docs.mosip.io/)
- 💬 [Community Forum](https://community.mosip.io/)

---

## License

This project is licensed under the [Mozilla Public License 2.0](./LICENSE).
