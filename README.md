Jenkins Packer Build Pipeline

Purpose of this project is to dynamically create an Amazon VPC using Terraform, build OS image(s) using Hashicorp Packer tool then have Terraform destroy the VPC after the new AMI has been saved.

Jenkins Pipeline will be used to execute the following steps.

1) Jenkins downloads and executes the latest pipeline script from the Jenkinsfile in this Github repository.

2) Terraform executes init, plan, apply and show. The Amazon Packer Build VPC should be created at this point.  

3) Execute the run_packer_build.sh script to build store and snapshot the new AMI before proceeding to next step.

4) Terraform destroys the Amazon Packer Build VPC.
