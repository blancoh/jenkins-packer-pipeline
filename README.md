# Jenkins Packer Build Pipeline

Project Goal: Create an Amazon VPC, Build Custom Amazon Machine Image (AMI) and Nginx Container stored in ECR then Destroy the Amazon VPC once completed. 

Current OS: Ubuntu Bionic 18.04

1) Download GIT repository
2) Execute Jenkinsfie
3) Run Terraform to create Amazon VPC
4) Execute run_packer_build.sh script to build custom AMI with Packer.
5) Terraform destroy to delete the Amazon Packer VPC.

Requirements:
Jenkins
Terraform
Ansible
Packer 
AWS CLI Tool
