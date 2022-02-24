resource "aws_instance" "instances" {

  count = length(var.add_instance)

  ami = "${data.aws_ami.amazon-linux-2.id}"

  # var.add_instance[count.index].

  instance_type = "${var.add_instance[count.index].instance_type}"
  key_name = "${var.add_instance[count.index].key_name}"
  iam_instance_profile = "${var.add_instance[count.index].iam_instance_profile}"
  ######################################
  subnet_id = "${data.aws_subnets.subnet_list.ids[count.index]}"
 ########################################
  security_groups = ["${var.add_instance[count.index].security_groups}"]
 ########################################
  ebs_optimized = "${var.add_instance[count.index].ebs_optimized}"
  associate_public_ip_address = "${var.add_instance[count.index].associate_public_ip_address}"

    root_block_device {
    volume_type = "${var.add_instance[count.index].volume_type}"
    volume_size = "${var.add_instance[count.index].volume_size}"
  }
  user_data = <<EOF
  ${var.add_instance[count.index].user_data}
   EOF

  tags = merge(var.tags, tomap({ "Name" = "${var.prefix}-${var.add_instance[count.index].name}" }))

}



