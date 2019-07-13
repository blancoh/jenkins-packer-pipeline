#terraform {
#  backend "s3" {
#    bucket = "terraform-bucket-hab"
#    key    = "terraform.tfstate"
#    region = "us-east-1"
#  }
#}

#resource "aws_s3_bucket" "terraform-bucket-alex" {
#  bucket = "terraform-bucket-alex"
#  acl = private
#
#  tags = {
#    Name = "My terraform bucket"
#    Environment = "dev"
#  }
#
#}
