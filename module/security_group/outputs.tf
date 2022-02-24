
output "sg_id" {
    value = aws_security_group.sg.*.id
}

output "sg_map" {
    value = local.id_map
}

output "sg_map_element" {
    value = local.id_map["web_elb"]
}