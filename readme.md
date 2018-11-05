# qmi-scenarios

QMI Scenarios for Partners

## Requirements
* Virtualbox 5.2.x +
* Vagrant 2.1.2 +
* Git

## Repository dependencies
* https://github.com/Qlik-Partner-Tools/qlik-automation-core.git

It'll get resolved when executing script **init-shared-content**

## Get started
* Open a terminal window and checkout clone this repository

```
git clone https://github.com/Qlik-Partner-Tools/qmi-scenarios.git

```

* Enter qmi-scenarios folder and initialise folder "shared-content"

Linux and OSX
```
cd qmi-scenarios
./init-shared-content.sh

```
Windows
```
cd qmi-scenarios
./init-shared-content.bat

```

* Then update Qlik license information in file *./shared-content/licenses/qlik-license.json* (only for the products your scenarios are built for)

```json
{
    "sense": {
        "name": "ENTER_NAME_HERE",
        "control": "ENTER_CONTROL_CODE_HERE",
        "serial": "ENTER_SERIAL_CODE_HERE",
        "organization": "ENTER_YOUR_ORG_NAME_HERE",
        "lef": "QLIKSENSE_LEF_STRING_GOES_HERE"
    },
    "qap": {
        "name": "ENTER_NAME_HERE",
        "control": "ENTER_CONTROL_CODE_HERE",
        "serial": "ENTER_SERIAL_CODE_HERE",
        "organization": "ENTER_YOUR_ORG_NAME_HERE"
    },
    "qlikview": {
        "name": "ENTER_NAME_HERE",
        "control": "ENTER_CONTROL_CODE_HERE",
        "serial": "ENTER_SERIAL_CODE_HERE",
        "organization": "ENTER_YOUR_ORG_NAME_HERE"
    },
    "datamarket": {
        "name": "ENTER_NAME_HERE",
        "control" : "ENTER_CONTROL_CODE_HERE",
        "serial": "ENTER_SERIAL_CODE_HERE",
        "termsAcceptance": {},
        "organization": "ENTER_YOUR_ORG_NAME_HERE",
        "lef": "DATAMARKET_LEF_STRING_GOES_HERE"
    }
}
```

* Enter the folder for one of the available scenarios, ie: qmi-qs-sn, and run the vagrant script to provision

```
cd qmi-qs-sn
vagrant up
```


