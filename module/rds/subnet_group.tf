resource "aws_db_subnet_group" "rds_sub_group" {
  count = length(keys(var.subnet_group))

  name       = "${var.prefix}-db-${values(var.subnet_group)[count.index].sub_group_name}"
  subnet_ids = ["subnet-0fa0de101d68d662a", "subnet-05112fe40e0bb016e"]
  ################## data소스 활용 실패 

  tags = {
    Name = "${var.prefix}-db-${values(var.subnet_group)[count.index].sub_group_name}"
  }
}
