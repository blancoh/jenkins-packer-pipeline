Packer Build Pipeline

Purpose of this project is to dynamically create an Amazon VPC using Terraform, build OS image(s) using Hashicorp Packer tool then have Terraform destroy the VPC after the new AMI has been saved.

Steps:

Jenkins will be used to execute the following steps using a pipeline.

1) Jenkins will pull the latest Github repository.

2) Terraform will perform init, plan and apply to create the Amazon Packer Build VPC.  

3) The run_packer_build.sh shell script will extract the vpc_id and subnet_id using the AWS cli tools in order to pass them as variables to the packer build command. The AMI will be stored and snapshot taken at this time before proceeding to next step.

4) Terraform destroys the Amazon Packer Build VPC.

