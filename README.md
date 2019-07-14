Jenkins Packer Build Pipeline

OS version: Ubuntu Bionic 18.04

Purpose of this project is to create a fresh Amazon VPC to build Amazon Machine Image (AMI) then destroy the VPC. 

Jenkinsfile Pipeline script will execute the following steps.

1) Jenkins pulls the latest Github repository and executes the latest Jenkinsfile.

2) Terraform init to download required modules.

3) Terraform plan to pre-validate apply will be successful.

4) Terraform apply to create the Amazon Packer VPC.

5) Terraform show to display what was recently created.  

3) Execute the run_packer_build.sh script to build the new AMI with Packer.

4) Terraform executes a destroy to delete the Amazon Packer VPC.
