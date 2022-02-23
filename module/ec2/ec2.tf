resource "aws_instance" "instances" {

  count = length(keys(var.add_instance))

  ami = "${data.aws_ami.amazon-linux-2.id}"
  instance_type = "${values(var.add_instance)[count.index].instance_type}"
  key_name = "${values(var.add_instance)[count.index].key_name}"
  iam_instance_profile = "${values(var.add_instance)[count.index].iam_instance_profile}"
  subnet_id = "${values(var.add_instance)[count.index].subnet_id}"
  security_groups = "${values(var.add_instance)[count.index].security_groups}"
  ebs_optimized = "${values(var.add_instance)[count.index].ebs_optimized}"
  associate_public_ip_address = "${values(var.add_instance)[count.index].associate_public_ip_address}"

    root_block_device {
    volume_type = "${values(var.add_instance)[count.index].volume_type}"
    volume_size = "${values(var.add_instance)[count.index].volume_size}"
  }
  user_data = <<EOF
  ${values(var.add_instance)[count.index].user_data}
   EOF

  tags = merge(var.tags, tomap({ "Name" = "${var.prefix}-${keys(var.add_instance)[count.index]}" }))

}



