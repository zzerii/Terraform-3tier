# data "aws_security_groups" "sg" {
#     filter {
#       name =  "tag:Name"
#       values = ["${var.db_instance.*.vpc_security_group_name}"]
#     }
  
# }

# data "aws_subnet" "subnet_ids" {
#     filter {
#       name = "tags:Name"
#       values = ["${var.subnet_group.*.  sub_name}"]
#     }
  
# }
