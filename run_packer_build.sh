#!/bin/bash

vpc_id=`/usr/local/bin/aws ec2 describe-vpcs --filters "Name=tag:Name,Values=Packer_VPC" --query 'Vpcs[*].VpcId' --output text`
subnet_id=`/usr/local/bin/aws ec2 describe-subnets --filters "Name=tag:Name,Values=Packer_Subnet_A" --query 'Subnets[*].SubnetId' --output text`
/usr/local/bin/packer build -var "aws_vpc=$vpc_id" -var "aws_subnet=$subnet_id" packer_build.json
