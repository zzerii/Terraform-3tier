

output "sub" {
    value = data.aws_subnets.subnet_list.ids
}

output "sg" {
    value = data.aws_security_groups.sg_list
}
