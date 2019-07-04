echo '--- Updating Ubuntu'
sudo apt-get -qq -y update

echo '--- Installing git'
sudo apt-get install -qq git socat nfs-kernel-server > /dev/null 2>&1

echo '--- Disabling swap'
sudo swapoff -a

# Comment the swap line from fstab - permanently disable swap
sudo sed -i.bak '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

echo '--- Setting up NFS'
#NFS
sudo mkdir -p /data/k8s
sudo chown nobody:nogroup /data/k8s
sudo bash -c 'cat << EOF >>/etc/exports
/data/k8s   *(rw,sync,no_subtree_check,no_root_squash)
/data       *(rw,fsid=0,no_subtree_check,sync)
EOF'

sudo service nfs-kernel-server restart

echo '--- Adding DNS server (Google)'
sudo  sed -i '1s/^/nameserver 8.8.8.8 /' /etc/resolv.conf
