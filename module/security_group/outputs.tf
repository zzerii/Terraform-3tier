# output "sg_id" {
#     value = "${zipmap(var.rules_list, aws_security_group.sg.*.id)}"
#   }

# output "sg_id" {
#   value = zipmap("${var.rules_list}", ["${aws_security_group.sg.*.id}"])
# }

output "sg_id" {
    value = aws_security_group.sg.*.id
  
}