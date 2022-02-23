resource "aws_db_parameter_group" "rds_param_group" {
  count = length(keys(var.param))
  name   = "${var.prefix}-db-${values(var.param)[count.index].param_name}"
  family = "${values(var.param)[count.index].param_family}"

  parameter {
    name  = "character_set_server"
    value = "${values(var.param)[count.index].character_set_server}"
  }
  parameter {
    name  = "character_set_client"
    value = "${values(var.param)[count.index].character_set_client}"
  }
}