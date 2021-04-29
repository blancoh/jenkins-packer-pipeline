# Jenkins Packer Build Pipeline

Project Goal: Build custom Nginx container and Amazon Machine Image (AMI)

Current OS: Ubuntu Bionic 18.04

Detailed Steps:
1) Download GIT repository
2) Execute Jenkinsfile pipeline script
3) Build custom Nginx container and store in Amazon ECR
4) Run Terraform to create Amazon VPC
5) Execute Packer to provision AMI
6) Run Terraform to destroy Amazon VPC

Requirements:
Jenkins
Terraform
Ansible
Packer 
AWSCLI
