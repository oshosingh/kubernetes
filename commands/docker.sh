sudo apt update -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update -y 
apt-cache policy docker-ce
sudo apt install docker-ce -y
sleep 5

echo "{\"exec-opts\": [\"native.cgroupdriver=systemd\"], \"storage-driver\": \"overlay2\" }" > /etc/docker/daemon.json
systemctl daemon-reload
systemctl restart docker
