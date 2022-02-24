# data "aws_vpc" "vpc" {
#     tags = {
#       "Name" = "dev-vpc-test"
#     }
# }

 data "aws_vpc" "vpc" {
   filter {
     name = "tag:Name"
     values = ["${var.vpc_name}"]
   }
 }

#   data "aws_subnets" "web_sub" {
#    filter {
#      name = "tag:Name"
#      values = var.web_alb["subnets"]
#    }
#  }

#   data "aws_subnets" "was_sub" {
#    filter {
#      name = "tag:Name"
#      values = var.was_alb["subnets"]
#    }
#  }