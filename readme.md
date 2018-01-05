# qmi-scenarios-ext

QMI Scenarios for Partners

## Requirements
* Virtualbox
* Vagrant
* Git

## Repository dependencies
* https://gitlab.com/qmi/qlik-automation-core

It'll get resolved when executing **init-shared-content.sh**

## Get started
* Open a terminal window
* Initialise folder "shared-content" by executing the following

Linux and OSX
```
./init-shared-content.sh

```
Windows
```
./init-shared-content.bat

```

* Then update Qlik license information in file **./shared-content/licenses/qlik-license.json**

* Enter the folder for one of the available scenarios, ie: qmi-qs-sn, and run the vagrant script to provision
```
cd qmi-qs-sn
```
```
vagrant up
```


