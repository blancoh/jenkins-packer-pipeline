Jenkins Packer Build Pipeline

OS version: Ubuntu Bionic 18.04

Purpose of this project is to Create an Amazon VPC, Build an Amazon Machine Image (AMI) and Destroy the Amazon VPC. 

Jenkinsfile Pipeline script will execute the following steps.

1) Jenkins pulls the latest Github repository and executes the latest Jenkinsfile.

2) Terraform init to download required modules.

3) Terraform plan to validate configuration.

4) Terraform apply to create the Amazon Packer VPC.

5) Terraform show to display what was recently created.  

3) Execute run_packer_build.sh script to build new AMI with Packer.

4) Terraform destroy to delete the Amazon Packer VPC.
