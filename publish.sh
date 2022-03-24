#!/bin/sh
# Script to automate publishing. 
git add *.tgz
git commit -m "Updated" *.tgz
git push origin gh-pages
./gen_index.sh 
git commit -m "Updated" index.yaml
git push origin gh-pages

