####################
#--------NAT-------#
####################
resource "aws_nat_gateway" "terraform_nat" {
    count = length(var.availability_zones)
    allocation_id = element(aws_eip.terraform_nat_eip.*.id, count.index)
    connectivity_type = "public"
    subnet_id = element(aws_subnet.public.*.id, count.index)
    tags =merge(var.tags, tomap({ "Name" = "${var.prefix}-nat-${var.az[count.index]}" }))

}