echo 'Initialising Helm'
helm init --wait --upgrade

echo 'adding qlik-stable helm repo'
helm repo add qlik-stable https://qlik.bintray.com/stable

helm repo update

echo "--- Create QMI StorageClass from NFS location"
hostname=`hostname`
storageClassName="qmistorage"
helm upgrade --install $storageClassName stable/nfs-client-provisioner --set nfs.server=$hostname --set nfs.path=/data/k8s --set storageClass.name=$storageClassName

echo "--- Create Persistent Volume Claims for storage"
kubectl apply -f /vagrant/files/pvc-mongo.yaml

sleep 10

#echo "--- Install Custom MongoDB"
#helm install -n qmimongo stable/mongodb -f /vagrant/files/values-mongo.yaml
#sleep 10
#-----------

echo '--- Qlik Sense INIT - Custom Resource Definition'
helm install -n qliksense-init qlik-stable/qliksense-init

echo '---  Installing QlikSense from Stable repo'
helm install -n qliksense qlik-stable/qliksense -f /vagrant/files/values-minikube.yaml 
