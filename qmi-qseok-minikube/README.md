# Qlik Sense Enterprise on Kubernetes (Minikube)
## Description
A local demonstration environment for showing the benefits of Qlik Sense Enterprise on Kubernetes. A custom MongoDB is used for storage and Persistence is setup for mayor container (mongo, redis, engine, library)

| Servername        | Server IP         | Purpose | 
|-------------------|-------------------|---------|
| qmi-qseok-minikube | 192.168.56.120   | Qlik Sense Enterprise on Kubernetes |

## Hosts file
It is recommended that you add the following to both your laptops HOSTS file 

```
192.168.56.120 qmi-qseok-minikube
```

And to any Qlik Sense Enterprise for Windows servers that will distribute content.

The hosts file is found here: c:\windows\system32\drivers\etc

## Linux Users
| Name | Password |
|------|-----|
|vagrant|vagrant|


## Connection
Please use __vagrant ssh__ to connect to the server (or if using your own SSH use ssh vagrant@elastic.example to connect (password: vagrant))

You can monitor PODs by executing 

```
kubectl get pod -w
```


## Purpose
This scenario provisions the latest stable release of Qlik Sense Enterprise on Kubernetes build in a Minikube provisionined K8s cluster. Custom MongoDB and Persistence is enabled.


## What is installed
### Software
1. Ubuntu Xenial 16.04
2. Docker CE
3. Docker Compose
4. Minikube (Kubernetes)
5. Helm
6. Qlik Sense Enterprise on Kubernetes (QSEoK) from "stable" Bintray repository.

## URLs

| Name | URL |
|------|-----|
|QSEoK hub|[https://qmi-qseok-minikube:32443](https://qmi-qseok-minikube:32443)|
|QSEoK console|[https://qmi-qseok-minikube:32443/console](https://qmi-qseok-minikube:32443/console)|
|QSEoK API license assignments|[https://qmi-qseok-minikube:32443/api/v1/licenses/assignments](https://qmi-qseok-minikube:32443/api/v1/licenses/assignments)|
|QSEoK API current logged-in user|[https://qmi-qseok-minikube:32443/api/v1/users/me](https://qmi-qseok-minikube:32443/api/v1/users/me)|

## Available Users in Auth0
The following table outlines users that have been created and can be used within the QSEfE hub and QSEfW through SAML.

| User | Password | Groups |
|------|----------|--------|
|harley@qlikcloud.com|Password1!|Everyone, Sales|
|barb@qlikcloud.com|Password1!|Everyone, Support|
|quinn@qlikcloud.com|Password1!|Everyone, Accounting|
|sim@qlikcloud.com|Password1!|Everyone, Accounting|
|phillie@qlikcloud.com|Password1!|Everyone, Marketing, Sales|
|peta@qlikcloud.com|Password1!|Everyone, Engineering|
|marne@qlikcloud.com|Password1!|Everyone, Marketing|
|sibylla@qlikcloud.com|Password1!|Everyone, Accounting|
|evan@qlikcloud.com|Password1!|Everyone, Engineering|
|franklin@qlikcloud.com|Password1!|Everyone, Sales|

## QSEfW
### 1. Configuration

You have to provision QMI scenario ```qmi-qs-sn``` !!!!

Provision Qlik Sense Enterprise for Windows version >= Junio 2018.

### 2. Setup Virtual Proxy for SAML Authentication

Download [metadata file](https://s3-eu-west-1.amazonaws.com/qmidata/others/qsefe/qsefe-aor_eu_auth0_com-metadata.xml)

![](https://s3-eu-west-1.amazonaws.com/qmidata/others/qsefe/vp_saml_auth0.png)

### 3. Create a Multicloud Deployment

Check that all QSEfE Pods are at __Running__ status. SSH into the VM and execute: ```kubectl get pod```

```
NAME                                                              READY   STATUS    RESTARTS   AGE
elastic-distributor-elastic-distributor-tester-796c8498b4-6z5jh   1/1     Running   0          6m58s
qsefe-collections-858b9688d6-lwwv9                                1/1     Running   5          7m3s
qsefe-data-prep-7b4f4c6879-4l8dh                                  1/1     Running   0          7m3s
qsefe-edge-auth-59f49df498-vnhpg                                  2/2     Running   1          7m2s
qsefe-engine-546d974979-d49qs                                     1/1     Running   0          7m2s
qsefe-feature-flags-7cf88c8c45-72vwm                              1/1     Running   0          7m2s
qsefe-hub-76476b94fc-9hz55                                        1/1     Running   0          7m2s
qsefe-identity-providers-59697c68bc-dsv4v                         1/1     Running   0          7m2s
qsefe-insights-f589d659b-d79bc                                    1/1     Running   0          7m2s
qsefe-licenses-577656f59c-5qqwr                                   1/1     Running   0          7m1s
qsefe-locale-7cbc784d46-zxsfb                                     1/1     Running   0          7m1s
qsefe-mira-789896c995-kqvmx                                       1/1     Running   0          7m1s
qsefe-mongodb-656d6b5fd4-ghj4r                                    1/1     Running   1          7m1s
qsefe-nginx-ingress-controller-565b549d96-7ppss                   1/1     Running   0          7m2s
qsefe-nginx-ingress-default-backend-754b55fc48-fscqm              1/1     Running   0          7m2s
qsefe-policy-decisions-9b86d59f7-f56r7                            1/1     Running   0          7m1s
qsefe-qix-sessions-7798684bdf-q5rth                               1/1     Running   0          7m
qsefe-redis-master-0                                              1/1     Running   0          7m2s
qsefe-redis-metrics-56cd4d7dbc-fc8gb                              1/1     Running   0          7m
qsefe-redis-slave-959d66cb4-stgnb                                 1/1     Running   0          7m
qsefe-reporting-7595b9d65d-z46p4                                  2/2     Running   0          7m
qsefe-resource-library-5c768cc78d-52pmr                           1/1     Running   0          6m59s
qsefe-sense-client-79fb4cf5c-ppgzk                                1/1     Running   0          6m59s
qsefe-tenants-695477954f-5spbh                                    1/1     Running   0          6m59s
qsefe-traefik-d488496cc-wxpdz                                     1/1     Running   0          7m2s
qsefe-users-cf468c495-cbgds                                       1/1     Running   0          6m59s
```

Then, access Multicloud Console:

[https://qmi-qs-sn/api/msc](https://qmi-qs-sn/api/msc)


Name: ```qsefeAuth0```

Client ID: ```3i6odPmLGNoDAcr53jzB9KhVvYYzivkQ```

Client Secret: ```p3jGoBHp1PvP4Uwh3GyBXLq6b38TyOwl2Ut_ynGdQ-i5nlruEIyAn6edaHQkNKAV```

Token endpoint: ```https://qsefe-aor.eu.auth0.com/oauth/token```

API endpoint: ```https://qmi-qsefe-auth0:32443```

Audience: ```qlik.api```

![](https://s3-eu-west-1.amazonaws.com/qmidata/others/qsefe/deployment-setup.png)


### 4. Setup Custom Properties

| Property Name | Property Value(s) |
|------|----------|
|collections|Sales, Finance, Marketing|
|groupswithaccess|Everyone|
|sendto|qsefeAuth0|

### 5. Setup Distribution Policies

![](https://s3-eu-west-1.amazonaws.com/qmidata/others/qsefe/distribution-policies.png)

```
((subject.name="qsefeAuth0" and resource.@sendto="qsefeAuth0"))
```

### 6. Allocate Analyzer license to users

In QMC, allocate Analyzer license to users so they can open apps in QSEfE.


## QSEfE Elastic Distributor: Access and QSEfE License Setup

[https://qmi-qsefe-auth0:32443/elastic-distributor](https://qmi-qsefe-auth0:32443/elastic-distributor)

Identity Provider Token Endpoint: ```https://qsefe-aor.eu.auth0.com/oauth/token```

Client ID: ```3i6odPmLGNoDAcr53jzB9KhVvYYzivkQ```

Client Secret: ```p3jGoBHp1PvP4Uwh3GyBXLq6b38TyOwl2Ut_ynGdQ-i5nlruEIyAn6edaHQkNKAV```

Audience: ```qlik.api```

Go to "Manage License" and make sure the license is the same as the one used in QSEfW, otherwise copy your LEF from QMC and paste it here.

## Support Information
| Author | Version | Date Published |
|--------|---------|----------------|
|Manuel Romero|2.0|29 April 2019|
