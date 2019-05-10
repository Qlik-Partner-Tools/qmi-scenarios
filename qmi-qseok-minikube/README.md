# Qlik Sense Enterprise on Kubernetes (Minikube)
## Description
A local demonstration environment for showing the benefits of Qlik Sense Enterprise on Kubernetes. 

Vagrant is used to provision this enviroment. Enviroment parameters are:
- Base box: bento/ubuntu-16.04
- RAM: 6Gb
- IP: 192.168.56.120
- Hostname: qmi-qseok-minikube
- Linux Users: vagrant (password: vagrant)

| Servername        | Server IP         | Purpose | 
|-------------------|-------------------|---------|
| qmi-qseok-minikube | 192.168.56.120   | Qlik Sense Enterprise on Kubernetes |

## Purpose
This scenario provisions the latest stable release of Qlik Sense Enterprise on Kubernetes build in a Minikube provisionined K8s cluster. 

### What is installed
#### Software
1. Ubuntu 16.04
2. Docker CE
3. Docker Compose and Docker Machine
4. Minikube (Kubernetes)
5. Helm (package manager for Kubernetes)
6. Qlik Sense Enterprise on Kubernetes (QSEoK) from "stable" Bintray repository.


## Hosts file
Add the following to  your laptop's HOSTS file

```
192.168.56.120 qmi-qseok-minikube
```

And to any Qlik Sense Enterprise for Windows servers that will distribute content.

The hosts file is found here usually found in c:\windows\system32\drivers\etc

## Connection
Please use __vagrant ssh__ to connect to the server (or if using your own SSH use ssh vagrant@qmi-qseok-minikube to connect (password: vagrant)).

After provision has finished successfully enter the server (vagrant ssh) and monitor Kubernetes PODs by executing. 

```
kubectl get pod -w
```

All PODS should end up running after a few minutes (~10-15 minutes), then you can go to "QSEoK hub". And set your license in the "QSEoK admin tenant console".


## URLs

| Name | URL |
|------|-----|
|QSEoK hub|[https://qmi-qseok-minikube:32443](https://qmi-qseok-minikube:32443)|
|QSEoK Admin tenant console|[https://qmi-qseok-minikube:32443/console](https://qmi-qseok-minikube:32443/console)|
|QSEoK API license assignments|[https://qmi-qseok-minikube:32443/api/v1/licenses/assignments](https://qmi-qseok-minikube:32443/api/v1/licenses/assignments)|
|QSEoK API current logged-in user|[https://qmi-qseok-minikube:32443/api/v1/users/me](https://qmi-qseok-minikube:32443/api/v1/users/me)|

## Authenticaion: Simple OIDC
For a quick setup and demo reasons, a Simple OIDC provider has been deployed into Heroku and is used as the Identity Provider for QSEoK Authentication.

For more reference please follow this link: https://hub.docker.com/r/qlik/simple-oidc-provider/


The following table outlines users that can be used to access the QSEoK hub.

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

