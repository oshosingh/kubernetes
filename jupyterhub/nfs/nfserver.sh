sudo apt-get update
sudo apt install nfs-kernel-server 
sudo mkdir /mnt/jupyterhub -p
sudo chown nobody:nogroup /mnt/jupyterhub 
sudo chmod 777 /mnt/jupyterhub 

echo "/mnt/jupyterhub       *(rw,sync,no_subtree_check,no_root_squash,no_all_squash,insecure)" >> /etc/exports
sudo exportfs -a #making the file share available

sudo systemctl restart nfs-kernel-server #restarting the NFS kernel
