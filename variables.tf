variable "public_key_path" {
   default = "/apps/terraform/keys/id_rsa.pub"
}
variable "key_name" {
  description = "Desired name of AWS key pair"
  default     = "vagrant"
}
variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-east-1"
}
# Ubuntu Bionic 18.04 LTS (x64)
variable "aws_amis" {
  default = {
    eu-west-1 = "ami-01e6a0b85de033c99"
    us-east-1 = "ami-026c8acd92718196b"
  }
}
variable "dnszonename" {
  default = "aws.example.net"
  description = "my internal dns name"
}
variable "vpc_cidr" {
    default = "10.0.0.0/20"
  description = "the vpc cdir range"
}
variable "public_subnet_a" {
  default = "10.0.0.0/24"
  description = "Public subnet AZ A"
}
variable "public_subnet_b" {
  default = "10.0.4.0/24"
  description = "Public subnet AZ B"
}
variable "public_subnet_c" {
  default = "10.0.8.0/24"
  description = "Public subnet AZ C"
}
variable "private_subnet_a" {
  default = "10.0.1.0/24"
  description = "Private subnet AZ A"
}
variable "private_subnet_b" {
  default = "10.0.5.0/24"
  description = "Private subnet AZ B"
}
variable "private_subnet_c" {
  default = "10.0.9.0/24"
  description = "Private subnet AZ C"
}
