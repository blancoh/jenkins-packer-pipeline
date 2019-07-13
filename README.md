Packer Build Pipeline

Purpose of this project is to build a new Amazon VPC and create a new OS image using Packer tool. Once the image creation has been completed the VPC will be destroyed. 

Steps:

Jenkins is used to execute the pipeline.

1) Terraform will create the Packer Build VPC.

2) Bash script named create_json.sh will generate a packer_build_new.json file.

3) Packer tool will generate the new Amazon AMI and output the ID once finished.

4) Terraform will destroy the Packer Build VPC.

