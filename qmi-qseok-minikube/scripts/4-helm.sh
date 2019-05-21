echo 'Initialising Helm'
helm init --wait --upgrade

echo 'adding qlik-stable helm repo'
helm repo add qlik-stable https://qlik.bintray.com/stable

helm repo update
#----------
echo "--- Create QMI StorageClass"
hostname=`hostname`
sudo -u vagrant bash -c 'cat << EOF > /home/vagrant/qmiStorageClass.yaml
nfs:
  path: /data/k8s
  server: '"$hostname"'
storageClass:
  name: qmistorage
EOF'

helm install -n qmi stable/nfs-client-provisioner -f /home/vagrant/qmiStorageClass.yaml
#----------

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
