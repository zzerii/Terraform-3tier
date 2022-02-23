
####################
#--------IGW-------#
####################

resource "aws_internet_gateway" "terraform_igw" {
    vpc_id = aws_vpc.terraform_vpc.id

    tags =merge(var.tags, tomap({ "Name" = "${var.prefix}-${var.vpc_name}-igw" }))
}
