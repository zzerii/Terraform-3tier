# locals {
#   sg_list = {
#       "dev-bastion-sg" = "${data.aws_security_groups.bastion_sg.ids}",
#       "dev-web-sg" = "${data.aws_security_groups.web_sg.ids}",
#       "dev-was-sg" = "${data.aws_security_groups.was_sg.ids}"
#   }
# }

# locals {
#   subnet_list = {
#       "dev-pub-2a" = "${data.aws_subnet.bastion_subnet}",
#       "dev-web-2a" = "${data.aws_subnet.web_2a_subnet}",
#       "dev-web-2c" = "${data.aws_subnet.web_2c_subnet}",
#       "dev-was-2a" = "${data.aws_subnet.was_2a_subnet}",
#       "dev-was-2c" = "${data.aws_subnet.was_2c_subnet}",
      
#   }
# }


locals {
  ec2_var = flatten(values(var.add_instance))
}

