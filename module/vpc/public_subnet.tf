#------------------SUBNET------------------#

#--------PUB SUBNET-------#
resource "aws_subnet" "public" {
    count = length(var.availability_zones)
    vpc_id = aws_vpc.terraform_vpc.id

    availability_zone = element (var.availability_zones,count.index)

    cidr_block = element(var.subnets.public.cidr, count.index)
    tags =merge(var.tags, tomap({ "Name" = "${var.prefix}-pub-${var.az[count.index]}" }))
}