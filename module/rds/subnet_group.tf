resource "aws_db_subnet_group" "rds_sub_group" {
  count = length(keys(var.subnet_group))
  
  name       = "${var.prefix}-db-${values(var.subnet_group)[count.index].sub_group_name}"
  subnet_ids = data.aws_subnets.sub_list.ids

  tags = {
    Name = "${var.prefix}-db-${values(var.subnet_group)[count.index].sub_group_name}"
  }
}
