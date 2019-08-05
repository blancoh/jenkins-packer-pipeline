provider "aws" {
  region = "${var.aws_region}"
}

data "aws_availability_zones" "available" {}

resource "aws_key_pair" "auth" {
  key_name   = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
}

resource "aws_vpc" "default" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_support = true
    enable_dns_hostnames = true
    tags =  {
      Name = "Packer_VPC"
    }
}

resource "aws_subnet" "PublicSubnetA" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.public_subnet_a}"
  map_public_ip_on_launch = true
  tags = {
        Name = "Packer_Subnet_A"
  }
 availability_zone = "${data.aws_availability_zones.available.names[0]}"
}

resource "aws_route_table_association" "PublicSubnetA" {
    subnet_id = "${aws_subnet.PublicSubnetA.id}"
    route_table_id = "${aws_route_table.public_route_a.id}"
}

resource "aws_internet_gateway" "gw" {
   vpc_id = "${aws_vpc.default.id}"
    tags = {
        Name = "Internet Gateway"
    }
}

resource "aws_route_table" "public_route_a" {
  vpc_id = "${aws_vpc.default.id}"
  tags = {
      Name = "Packer_Route_A"
  }
  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"
    }
}
