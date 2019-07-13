#output "elb_dns_name" {
#  value = "${aws_elb.elb.dns_name}"
#}

#output "alb_dns_name" {
#  value = "${aws_lb.alb.dns_name}"
#}

#output "nlb_dns_name" {
#  value = "${aws_lb.nlb.dns_name}"
#}

#output "vpc_id" {
#  description = "The ID of the VPC"
#  value       = ${aws_vpc.this.*.id, [""])[0]
