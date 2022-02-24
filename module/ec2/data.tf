data "aws_ami" "amazon-linux-2" {
 most_recent = true
 owners = [ "amazon" ]

 filter {
   name   = "name"
   values = ["amzn2-ami-hvm*"]
 }
}

#보안그룹, 서브넷 이름일 경우에 어떻게 가져오는지 data에서는 count도 안되는데

# data "aws_security_groups" "bastion_sg" {
#   filter {
#      name = "tag:Name"
#      values = ["dev-bastion-sg"]
#    }
# } 
# data "aws_security_groups" "web_sg" {
#   filter {
#      name = "tag:Name"
#      values = ["dev-web-sg"]
#    }
# } 
# data "aws_security_groups" "was_sg" {
#   filter {
#      name = "tag:Name"
#      values = ["dev-was-sg"]
#    }
# } 
# ################################################################################



# data "aws_subnet" "bastion_subnet" {
#   tags = {
#     "Name" = "${var.add_instance.bastion.subnet_id}"
#   }
# }

# data "aws_subnet" "web_2a_subnet" {
#   tags = {
#     "Name" = "${var.add_instance.web-2a.subnet_id}"
#   }
# }

# data "aws_subnet" "web_2c_subnet" {
#   tags = {
#     "Name" = "${var.add_instance.web-2c.subnet_id}"
#   }
# }

# data "aws_subnet" "was_2a_subnet" {
#   tags = {
#     "Name" = "${var.add_instance.was-2a.subnet_id}"
#   }
# }

# data "aws_subnet" "was_2c_subnet" {
#   tags = {
#     "Name" = "${var.add_instance.was-2c.subnet_id}"
#   }
# }

