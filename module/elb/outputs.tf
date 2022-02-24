# output "name" {
#     value = data.aws_security_groups.name.ids
  
# }

# output "name" {
#     value = data.aws_subnets.web_sub.ids
# }

# output "name2" {
#     value = data.aws_subnets.was_sub.ids
# }
output "web" {
    value = aws_alb.web_alb.id
  
}
output "was" {
    value = aws_alb.was_alb.id
  
}