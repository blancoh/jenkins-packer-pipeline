variable "public_key_path" {
  default = "~/.ssh/id_rsa.pub"
}
variable "key_name" {
  description = "RSA key pair"
  default     = "id_rsa"
}
variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}
# Ubuntu Bionic 18.04 LTS (x64)
variable "aws_amis" {
  default = {
  us-east-1 = "ami-072afab67fc409af2"
    # us-east-1 = "ami-026c8acd92718196b"
  }
}
variable "vpc_cidr" {
  default = "10.0.0.0/20"
  description = "the vpc cdir range"
}
variable "public_subnet_a" {
  default = "10.0.0.0/24"
  description = "Public subnet AZ A"
}
