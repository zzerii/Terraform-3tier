# output "locals" {
#   value = local.all_subnets
# }

output "vpc_id" {
  value = aws_vpc.terraform_vpc.id
  
}

# output "subnet_id" {
#   value = ["${aws_subnet.*.id}"]
  
# }