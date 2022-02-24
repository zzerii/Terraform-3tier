
resource "aws_security_group_rule" "sg_rule_cidr" {
  count = length(var.rules_cidr)

  security_group_id = local.id_map[var.rules_cidr[count.index].security_group_id]
  type = var.rules_cidr[count.index].type
  from_port = var.rules_cidr[count.index].from_port
  to_port = var.rules_cidr[count.index].to_port
  protocol = var.rules_cidr[count.index].protocol
  cidr_blocks = var.rules_cidr[count.index].cidr_blocks
}

resource "aws_security_group_rule" "sg_rule_sg" {
  count = length(var.rules_sg)

  security_group_id = local.id_map[var.rules_sg[count.index].security_group_id]
  type = var.rules_sg[count.index].type
  from_port = var.rules_sg[count.index].from_port
  to_port = var.rules_sg[count.index].to_port
  protocol = var.rules_sg[count.index].protocol
  source_security_group_id = local.id_map[var.rules_sg[count.index].source_security_group_id]
}
