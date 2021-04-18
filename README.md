# Jenkins Packer Build Pipeline

Project Goal: Create an Amazon VPC, Build Custom Amazon Machine Image (AMI) and Nginx Container stored in ECR then Destroy the Amazon VPC once completed. 

Current OS: Ubuntu Bionic 18.04

Current container: Official Nginx container

1) Download GIT repository
2) Execute Jenkinsfile pipeline script
3) Run Terraform to create Amazon VPC
4) Build custom AMI using Packer
5) Build custom Nginx container and store in ECR
6) Terraform Destroy

Requirements:
Jenkins
Terraform
Ansible
Packer 
AWS-CLI
