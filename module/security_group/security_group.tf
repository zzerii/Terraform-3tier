resource "aws_security_group" "sg" {
  count = length(var.rules_list)
  vpc_id = var.vpc_id
  
  name = "${var.prefix}-${var.rules_list[count.index]}-sg"

  egress = [ {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = ""
      from_port = 0
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      protocol = -1   #ALL Protocol
      security_groups = []
      self = false    
      to_port = 0
    } ]

    tags =merge(var.tags, tomap({ "Name" = "${var.prefix}-${var.rules_list[count.index]}-sg" }))
}
