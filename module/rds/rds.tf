
resource "aws_db_instance" "devdb" {
  count = length(keys(var.db_instance))
 
  identifier = "${values(var.db_instance)[count.index].identifier}"

  engine               = "${values(var.db_instance)[count.index].engine}"
  engine_version       = "${values(var.db_instance)[count.index].engine_version}"

  instance_class       = "${values(var.db_instance)[count.index].instance_class}"
  storage_type = "${values(var.db_instance)[count.index].storage_type}"
  allocated_storage    = "${values(var.db_instance)[count.index].allocated_storage}"
  max_allocated_storage = "${values(var.db_instance)[count.index].max_allocated_storage}"


  multi_az = "${values(var.db_instance)[count.index].multi_az}"
  # availability_zone = "${values(var.db_instance)[count.index].availability_zone}"

  db_subnet_group_name = "${values(var.db_instance)[count.index].db_subnet_group_name}"
  publicly_accessible = "${values(var.db_instance)[count.index].publicly_accessible}"
  port = "${values(var.db_instance)[count.index].port}"
  vpc_security_group_ids = data.aws_security_groups.sg_list.ids


  name                 = "${values(var.db_instance)[count.index].name}"
  username             = "${values(var.db_instance)[count.index].username}"
  password             = "${values(var.db_instance)[count.index].password}"

  parameter_group_name = "${values(var.db_instance)[count.index].parameter_group_name}"

  backup_retention_period      = "${values(var.db_instance)[count.index].backup_retention_period}"
  copy_tags_to_snapshot = "${values(var.db_instance)[count.index].copy_tags_to_snapshot}"
  skip_final_snapshot  = "${values(var.db_instance)[count.index].skip_final_snapshot}"

  tags = {
    Name = "${values(var.db_instance)[count.index].identifier}"
  }
}