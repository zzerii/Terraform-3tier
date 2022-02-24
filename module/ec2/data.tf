data "aws_ami" "amazon-linux-2" {
 most_recent = true
 owners = [ "amazon" ]

 filter {
   name   = "name"
   values = ["amzn2-ami-hvm*"]
 }
}
data "aws_subnets" "subnet_list" {
  filter {
      name = "tag:Name"
      values = var.add_instance[*].subnet_id
    }
}


data "aws_security_groups" "sg_list" {
  filter {
     name = "tag:Name"
     values = var.add_instance[*].security_groups
   }
} 
