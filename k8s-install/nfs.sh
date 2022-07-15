sudo apt update -y
sudo apt install nfs-kernel-server -y
sudo apt install nfs-common -y
sudo mkdir -p /mount/nfs
sudo chown nobody:nogroup /mount/nfs
sudo chmod 777 /mount/nfs
sudo echo '/mount/nfs               *(rw,sync,no_root_squash,no_subtree_check)' >> /etc/exports
sudo exportfs -a #making the file share available
sudo systemctl restart nfs-kernel-server #restarting the NFS kernel
