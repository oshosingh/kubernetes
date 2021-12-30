cd /home/ubuntu/app/backend
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin <repopath>
kubectl apply -f deploy.yaml