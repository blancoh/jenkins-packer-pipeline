Jenkins Packer Build Pipeline

Purpose of this project is to create a fresh Amazon VPC to build Amazon Machine Images (AMI) then destroy the VPC. 

Jenkins Pipeline will be used to execute the following steps.

1) Jenkins downloads and executes the latest Jenkinsfile from this Github repository.

2) Terraform executes init, plan, apply and show to create the Amazon Packer VPC.  

3) Execute the run_packer_build.sh script to build store and snapshot the new AMI before proceeding to next step.

4) Terraform executes a destroy to delete the Amazon Packer VPC.
