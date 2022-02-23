
# resource "aws_security_group_rule" "sg_rule" {
#   #for_each = var.rules[count()]
#   #for_each = (locals.rules_num>1 ? {for k in var.rules : k=>index(v.from_port)} : var.rules)
#   count = length(var.rules)
#   #count = "${length(keys(var.rules)) * length(var.rules)}"
#   #security_group_id = output.sg_id[element(keys(var.rules), ceil(count.index/length(var.rules)))]
#   #for_each = local.security_rules
  
#   # security_group_id = data.aws_security_groups.sg_list[count.index].id
#   security_group_id = 
  
#   type = var.rules[count.index].type
#   from_port = var.rules[count.index].from_port
#   to_port = var.rules[count.index].to_port
#   protocol = var.rules[count.index].protocol
#   cidr_blocks = var.rules[count.index].cidr_blocks
#   source_security_group_id = local.id_map[var.rules[count.index].source_security_group_id]
# }
