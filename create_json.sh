#!/bin/bash

/usr/local/bin/terraform-0.12.3 apply -auto-approve

vpc_id=`aws ec2 describe-vpcs --filters "Name=tag:Name,Values=Packer_VPC" --query 'Vpcs[*].VpcId' --output text`
echo $vpc_id

subnet_id=`aws ec2 describe-subnets --filters "Name=tag:Name,Values=Public Subnet A" --query 'Subnets[*].SubnetId' --output text`
echo $subnet_id

tee <<EOF packer_build_new.json >/dev/null
{
    "variables": {
        "aws_access_key": "{{env \`AWS_ACCESS_KEY_ID\`}}",
        "aws_secret_key": "{{env \`AWS_SECRET_ACCESS_KEY\`}}",
        "region":         "us-east-1"
    },
    "builders": [
        {
            "access_key": "{{user \`aws_access_key\`}}",
            "ami_name": "packer-linux-aws-demo-{{timestamp}}",
            "instance_type": "t3.micro",
            "region": "us-east-1",
            "secret_key": "{{user \`aws_secret_key\`}}",
            "source_ami_filter": {
              "filters": {
              "virtualization-type": "hvm",
              "name": "ubuntu/images/*ubuntu-bionic-18.04-amd64-server-*",
              "root-device-type": "ebs"
              },
              "owners": ["099720109477"],
              "most_recent": true
            },
            "ssh_username": "ubuntu",
            "subnet_id": "$subnet_id",
            "type": "amazon-ebs",
            "vpc_id": "$vpc_id"
        }
    ],
    "provisioners": [
        {
            "type": "shell",
            "script": "./provision.sh"
        }
    ]
}
EOF

/usr/local/bin/packer build packer_build_new.json
