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
|harley@qlik.example|Password1!|Everyone, Sales|
|barb@qqlik.example|Password1!|Everyone, Support|
|quinn@qlik.example|Password1!|Everyone, Accounting|
|sim@qlik.example|Password1!|Everyone, Accounting|
|phillie@qlik.example|Password1!|Everyone, Marketing, Sales|
|peta@qlik.example|Password1!|Everyone, Engineering|
|marne@qlik.example|Password1!|Everyone, Marketing|
|sibylla@qlik.example|Password1!|Everyone, Accounting|
|evan@qlik.example|Password1!|Everyone, Engineering|
|franklin@qlik.example|Password1!|Everyone, Sales|



## Support Information
| Author | Version | Date Published |
|--------|---------|----------------|
|Manuel Romero|2.0|29 April 2019|
