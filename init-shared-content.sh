#!/bin/bash

# Public scripts
git clone git@gitlab.com:qmi/qlik-automation-core.git shared-content
cd shared-content
git checkout .
git pull origin master
cd ..

