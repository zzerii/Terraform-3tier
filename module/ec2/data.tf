data "aws_ami" "amazon-linux-2" {
 most_recent = true
 owners = [ "amazon" ]

 filter {
   name   = "name"
   values = ["amzn2-ami-hvm*"]
 }
}

#보안그룹, 서브넷 이름일 경우에 어떻게 가져오는지 data에서는 count도 안되는데
 

data "aws_security_groups" "sg" {

  filter {
   name   = "name"
   values = [var.security_groups]
 }
}

data "aws_subnet" "subnet" {

  filter {
   name   = "name"
   values = [var.subnet_id]
 }
}