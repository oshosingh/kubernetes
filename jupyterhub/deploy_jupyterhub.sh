echo "====================== Running NFS Server ============================"
sudo apt-get update
sudo apt install nfs-kernel-server 
sudo mkdir /mnt/jupyterhub -p
sudo chown nobody:nogroup /mnt/jupyterhub 
sudo chmod 777 /mnt/jupyterhub 

echo "/mnt/jupyterhub       *(rw,sync,no_subtree_check,no_root_squash,no_all_squash,insecure)" > /etc/exports
sudo exportfs -a # making the file share available

sudo systemctl restart nfs-kernel-server # restarting the NFS kernel

echo "====================== Deploying NFS Provisioner ======================="

sudo apt install nfs-common
helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner

helm install nfs-server nfs-subdir-external-provisioner/nfs-subdir-external-provisioner --set nfs.server= <host-machine-public-ip> --set nfs.path= /mnt/jupyterhub

echo "====================== Deploying Jupyterhub ============================"

helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
helm repo update
helm install myjup jupyterhub/jupyterhub --values /root/kubernetes/jupyterhub/values_manual.yaml
