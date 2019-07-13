Packer Build Pipeline

Purpose of this project is to dynamically create an Amazon VPC using Terraform, build OS image(s) using Hashicorp Packer tool then have Terraform destroy the VPC after the new AMI has been saved.

Steps:

Jenkins Pipeline will be used to execute the following steps.

1) Jenkins pulls the latest Github repository.

2) Terraform performs init, plan and apply to create the Amazon Packer Build VPC.  

3) The run_packer_build.sh shell script extracts the vpc_id and subnet_id using the AWS cli tools in order to pass them as variables to the packer build command. The AMI must be saved and snapshot must be successfull before proceeding to next step.

4) Terraform destroys the Amazon Packer Build VPC.
 
5) New AMI ID will be located in Packer build logs.
