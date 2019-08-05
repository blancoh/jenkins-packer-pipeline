# Jenkins Packer Build Pipeline

Project Goal: Create an Amazon VPC, Build Custom Amazon Machine Image (AMI) and Destroy the Amazon VPC. 

Jenkins required plugins: Pipeline, CloudBees AWS Credentials, GIT

Current OS version: Ubuntu Bionic 18.04

Jenkinsfile Pipeline script will execute the following steps.

1) Pull the Github Master branch and execute the latest Jenkinsfile.

2) Terraform init to download required modules.

3) Terraform plan to validate configuration.

4) Terraform apply to create the Amazon Packer VPC.

5) Terraform show to display what was recently created.  

3) Execute run_packer_build.sh script to build custom AMI with Packer.

4) Terraform destroy to delete the Amazon Packer VPC.

Requirements:
Workspace cleanup plugin - https://plugins.jenkins.io/ws-cleanup

Github Authentication plugin

CloudBees AWS Credentials plugins

Pipeline plugin

Terraform

Packer
