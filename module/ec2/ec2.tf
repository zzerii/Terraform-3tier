resource "aws_instance" "instances" {

  count = length(keys(var.add_instance))

  ami = "${data.aws_ami.amazon-linux-2.id}"
  instance_type = "${local.ec2_var[count.index].instance_type}"
  key_name = "${local.ec2_var[count.index].key_name}"
  iam_instance_profile = "${local.ec2_var[count.index].iam_instance_profile}"
  ######################################
  subnet_id = "${local.ec2_var[count.index].subnet_id}"
  # ${local.subnet_list[local.ec2_var[count.index].subnet_id]}
 ########################################
  security_groups = "${local.ec2_var[count.index].security_groups}"
 ########################################
  ebs_optimized = "${local.ec2_var[count.index].ebs_optimized}"
  associate_public_ip_address = "${local.ec2_var[count.index].associate_public_ip_address}"

    root_block_device {
    volume_type = "${local.ec2_var[count.index].volume_type}"
    volume_size = "${local.ec2_var[count.index].volume_size}"
  }
  user_data = <<EOF
  ${local.ec2_var[count.index].user_data}
   EOF

  tags = merge(var.tags, tomap({ "Name" = "${var.prefix}-${keys(var.add_instance)[count.index]}" }))

}



