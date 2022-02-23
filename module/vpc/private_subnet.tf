#--------PRI SUBNET-------#

resource "aws_subnet" "private_web" {
    count = length(var.availability_zones)
    vpc_id = aws_vpc.terraform_vpc.id

    availability_zone = element (var.availability_zones,count.index)

    cidr_block = element(var.subnets.web.cidr, count.index)
    tags =merge(var.tags, tomap({ "Name" = "${var.prefix}-pri-web-${var.az[count.index]}" }))
}

resource "aws_subnet" "private_was" {
    count = length(var.availability_zones)
    vpc_id = aws_vpc.terraform_vpc.id

    availability_zone = element (var.availability_zones,count.index)

    cidr_block = element(var.subnets.was.cidr, count.index)
    tags =merge(var.tags, tomap({ "Name" = "${var.prefix}-pri-was-${var.az[count.index]}" }))
}

resource "aws_subnet" "private_db" {
    count = length(var.availability_zones)
    vpc_id = aws_vpc.terraform_vpc.id

    availability_zone = element (var.availability_zones,count.index)

    cidr_block = element(var.subnets.db.cidr, count.index)
    tags =merge(var.tags, tomap({ "Name" = "${var.prefix}-pri-db-${var.az[count.index]}" }))
}