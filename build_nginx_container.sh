#!/bin/bash
sudo repo_name="nginx-dhmf"
sudo repo_url="522939339121.dkr.ecr.us-east-1.amazonaws.com"
#Authenticate
sudo PASSWD=`aws ecr get-login-password --region us-east-1`
sudo docker login --username AWS -p ${PASSWD} ${repo_url}
#Delete ECR Repository
sudo aws ecr delete-repository --repository-name ecrrepo001/${repo_name} --force
#Create ECR Repository
sudo aws ecr create-repository --repository-name ecrrepo001/${repo_name}
#Clear local docker repository of old images
sudo for i in $(docker images | grep ${repo_name} | awk '{print $3}');do docker rmi -f $i;done
#Build new Nginx container
sudo docker build  . -t ${repo_name}
#Get Image ID
sudo image_id=`docker images | grep ${repo_name} | awk '{print $3}'  | sort -u`
sudo echo $image_id
# Tag and Push to Amazon ECR
sudo docker tag ${image_id} 522939339121.dkr.ecr.us-east-1.amazonaws.com/ecrrepo001/${repo_name}:latest
sudo docker push 522939339121.dkr.ecr.us-east-1.amazonaws.com/ecrrepo001/${repo_name}:latest
