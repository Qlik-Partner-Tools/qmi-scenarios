#!/bin/bash

# Public scripts
git clone https://github.com/Qlik-Partner-Tools/qlik-automation-core.git shared-content
pushd shared-content
git checkout .
git pull origin master
popd

