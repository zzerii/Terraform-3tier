 data "aws_subnets" "web_sub" {
   filter {
     name = "tag:Name"
     values = var.web_alb["subnets"]
   }
 }

  data "aws_subnets" "was_sub" {
   filter {
     name = "tag:Name"
     values = var.was_alb["subnets"]
   }
 }

data "aws_security_groups" "web_sg" {
  filter {
     name = "tag:Name"
     values = var.web_alb["security_groups"]
   }
}

data "aws_security_groups" "was_sg" {
  filter {
     name = "tag:Name"
     values = var.was_alb["security_groups"]
   }
}