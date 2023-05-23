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

## Helm lint

### Helm Chart testing

#### Install chart-testing tool

#### Run chart lint on local
* Run the below command to test linting for all charts.
  ```sh
  CONFIG_FILE='.github/chart-testing-config.yaml'
  CHART_DIR='charts'
  TARGET_ORIGIN='origin'
  TARGET_BRANCH='gh-pages'
  LOG_FILE="./helm-lint-$CHART_DIR.log"
  
  ct lint --config=$CONFIG_FILE \
  --chart-dirs=$CHART_DIR \
  --remote=$TARGET_ORIGIN \
  --target-branch=$TARGET_BRANCH | tee -a "$LOG_FILE"
  ```
* Run the below command to test linting for a specific charts.
  ```sh
  CONFIG_FILE='.github/chart-testing-config.yaml'
  CHART_DIR='charts/admin-hotlist'
  TARGET_ORIGIN='origin'
  TARGET_BRANCH='gh-pages'
  LOG_FILE="./helm-lint-$( date +"%d-%m-%Y-%H-%M-%S" ).log"
  
  ct lint --config=$CONFIG_FILE \
  --charts=$CHART_DIR \
  --remote=$TARGET_ORIGIN \
  --target-branch=$TARGET_BRANCH | tee -a "$LOG_FILE"
  ```

#### Run Health Check for helm charts on local
* Create a file with the name `list.txt` consisting of a list of charts names along with the path.
  ```
  ls -d charts/* > list.txt;
  ```
* Create yaml directory for all charts present in list.txt
  ```sh
  while read -r chart; do
    echo -e "\nCHART: $chart\n";
  
    yaml_file='./chart-template.yaml'
    chart_name=$( echo $chart | awk -F / '{print $2}' );
    mkdir "$chart_name-yaml";
  
    helm template $chart > $yaml_file
    last_line=$( cat -n $yaml_file| tail -n 1 | awk '{print $1}' )
    line_nos="$( cat -n $yaml_file | awk '/---/{print $1}' ) $last_line"
    start_of_file=0
  
    for line in $line_nos; do
      if [[ $line -eq 1 ]]; then
        start_of_file=$line;
        continue;
      fi
  
      head_line=$(( line-1 ));
      tail_line=$(( line-start_of_file ));
  
      if [[ $line -eq $last_line ]]; then
        head_line=$line;
        tail_line=$(( line-start_of_file+1 ));
      fi
  
      start_of_file=$line;
      # echo "HEAD LINE: $head_line, TAIL LINE: $tail_line";
      
      yaml_type=$( head -n +$head_line $yaml_file | tail -n $tail_line | grep -c -E "kind\:\ Deployment|kind\:\ StatefulSet" || true );  # used "true" to return exit code as 0
      # echo "YAML TYPE: $yaml_type";
      if [[ "$yaml_type" -eq 0 ]]; then
         # echo "if YAML TYPE: $yaml_type";
         continue;
      fi
  
      filename=$( head -n +$head_line $yaml_file | tail -n $tail_line | awk -F '/' '/# Source/{print $3}' );
      echo "$filename";
      head -n +$head_line $yaml_file | tail -n $tail_line > "$chart_name-yaml/$filename";
    done
  done < ./list.txt
  ```
* Run health check validate for charts present in list.txt file.
  ```sh
  STOP=0
  while read -r chart; do
    if [[ $STOP -gt 0 ]]; then
      echo "FAILED !!!";
      break;
    fi
    echo -e "\n\nCHART: $chart\n";
  
    chart_name=$( echo $chart | awk -F / '{print $2}' );
    list=$( ls $chart_name-yaml );
  
    echo -e "YAML LIST :";
    echo -e "$list\n"
  
    for yaml in $list; do
      echo -e "YAML : $yaml";
      yamale -s .github/health-check-schema.yaml "$chart_name-yaml/$yaml" --no-strict
      if [[ $? -gt 0 ]]; then
        STOP=1;
        break;
      fi
    done
  
  done < ./list.txt
  ```

### Troubleshooting

* Below are commands used to perform the following operations for a YAML file
  * Remove spaces from the end of the line
  * Remove spaces after ": "
  * Remove spaces after "- "
  * Remove multiple empty lines to only one line
  * Remove empty lines from the beginning & end of the file.
  ```
  sed -i 's/\s*$//g' <path/to/yaml/file>                                     ## To remove spaces from end of line
  sed -i 's/:\s\s*/: /g' <path/to/yaml/file>                                 ## To remove spaces after ": "
  sed -i 's/-\s\s*/- /g' <path/to/yaml/file>                                 ## To remove spaces after "- "
  sed -i -e '/./,$!d' -e :a -e '/^\n*$/{$d;N;ba' -e '}' <path/to/yaml/file>  ## To remove empty lines from beginning and end ( if end_lines_empty > 1 )
  sed -i '/^$/N;/^\n$/D' <path/to/yaml/file>                                 ## To remove multiple empty lines to only one line
  ```

* Below are commands used to perform the following operations for `values.yaml` & for `Chart.yaml` file
    * Remove spaces from the end of the line
    * Remove spaces after ": "
    * Remove spaces after "- "
    * Remove multiple empty lines to only one line
    * Remove empty lines from the beginning & end of the file.
  ```
  #charts="charts/mosip-file-server charts/admin-ui charts/admin-service";
  charts="$( ls -d charts/* )"
  
  for chart in $charts; do
    echo "CHART: $chart";
    for yaml_file in values Chart; do
      sed -i 's/\s*$//g'     "$chart/$yaml_file.yaml";
      sed -i 's/:\s\s*/: /g' "$chart/$yaml_file.yaml";
      sed -i 's/-\s\s*/- /g' "$chart/$yaml_file.yaml";
      sed -i -e '/./,$!d' -e :a -e '/^\n*$/{$d;N;ba' -e '}'  "$chart/$yaml_file.yaml";
      sed -i '/^$/N;/^\n$/D' "$chart/$yaml_file.yaml";
    done
  done
  ```
* Remove files/directories
  ```
  rm -rf *-yaml chart-template.yaml list.txt
  ```


## License
This project is licensed under the terms of [Mozilla Public License 2.0](LICENSE).
