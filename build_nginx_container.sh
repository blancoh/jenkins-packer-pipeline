#!/bin/bash
repo_folder="$1"
repo_name="$2"
repo_url="$3"
#Authenticate
PASSWD=`/usr/local/bin/aws ecr get-login-password --region us-east-1`
sudo docker login --username AWS -p ${PASSWD} ${repo_url}
#Delete ECR Repository
/usr/local/bin/aws ecr delete-repository --repository-name ecrrepo001/${repo_name} --force
#Create ECR Repository
/usr/local/bin/aws ecr create-repository --repository-name ecrrepo001/${repo_name}
#Clear local docker repository of old images
for i in $(sudo docker images | grep ${repo_name} | awk '{print $3}');do sudo docker rmi -f $i;done
#Build new Nginx container
sudo docker build  . -t ${repo_name}
#Get Image ID
image_id=`sudo docker images | grep ${repo_name} | awk '{print $3}'  | sort -u`
sudo echo $image_id
# Tag and Push to Amazon ECR
sudo docker tag ${image_id} ${repo_url}/${repo_folder}/${repo_name}:latest
sudo docker push ${repo_url}/${repo_folder}/${repo_name}:latest
