# Create a VPC to launch our instances into
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
        Name = "Public Subnet A"
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

resource "aws_network_acl" "all" {
   vpc_id = "${aws_vpc.default.id}"
    egress {
        protocol = "-1"
        rule_no = 2
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }
    ingress {
        protocol = "-1"
        rule_no = 1
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }
    tags = {
        Name = "open acl"
    }
}

resource "aws_route_table" "public_route_a" {
  vpc_id = "${aws_vpc.default.id}"
  tags = {
      Name = "Public Route A"
  }
  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"
    }
}
