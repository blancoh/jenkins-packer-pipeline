Packer Build Pipeline

Purpose of this project is to build a new Amazon VPC and create a new OS image using Packer tool. Once the image creation has been completed the VPC will be destroyed. 

Steps:

Jenkins is used to execute the pipeline.

1) Terraform creates the Amazon Packer Build VPC.

2) Bash script named create_json.sh will generate a packer_build_new.json file.

3) Packer builds the new Amazon AMI image and prints the new ami id to stdout.

4) Terraform destroys the Amazon Packer Build VPC.

