#!/bin/bash

aws_bin=`which aws`
packer_bin=`which packer`

vpc_id=$($aws_bin ec2 describe-vpcs --filters "Name=tag:Name,Values=Packer_VPC" --query 'Vpcs[*].VpcId' --output text)
subnet_id=$($aws_bin ec2 describe-subnets --filters "Name=tag:Name,Values=Packer_Subnet_A" --query 'Subnets[*].SubnetId' --output text)
$packer_bin build -var "aws_vpc=$vpc_id" -var "aws_subnet=$subnet_id" packer_build.json
