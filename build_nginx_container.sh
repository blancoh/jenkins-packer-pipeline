#!/bin/bash
repo_name="nginx-dhmf"
repo_url="522939339121.dkr.ecr.us-east-1.amazonaws.com"
#Authenticate
PASSWD=`aws ecr get-login-password --region us-east-1`
docker login --username AWS -p ${PASSWD} ${repo_url}
#Delete ECR Repository
aws ecr delete-repository --repository-name ecrrepo001/${repo_name} --force
#Create ECR Repository
aws ecr create-repository --repository-name ecrrepo001/${repo_name}
#Clear local docker repository of old images
for i in $(docker images | grep ${repo_name} | awk '{print $3}');do docker rmi -f $i;done
#Build new Nginx container
docker build  . -t ${repo_name}
#Get Image ID
image_id=`docker images | grep ${repo_name} | awk '{print $3}'  | sort -u`
echo $image_id
# Tag and Push to Amazon ECR
docker tag ${image_id} 522939339121.dkr.ecr.us-east-1.amazonaws.com/ecrrepo001/${repo_name}:latest
docker push 522939339121.dkr.ecr.us-east-1.amazonaws.com/ecrrepo001/${repo_name}:latest
