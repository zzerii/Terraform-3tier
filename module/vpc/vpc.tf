##### 더 해 볼 부분 ######
# pri subnet 부분 너무 난잡한디 이거 for_each으로..

#------------------VPC------------------#
resource "aws_vpc" "terraform_vpc" {
    cidr_block = var.vpc_cidr

    enable_dns_support   = true
    enable_dns_hostnames = true
    instance_tenancy = "default"

    tags =merge(var.tags, tomap({ "Name" = "${var.prefix}-${var.vpc_name}" }))    
}

