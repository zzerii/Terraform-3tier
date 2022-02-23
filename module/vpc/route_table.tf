##############################
#---------Route table--------#
##############################

#--------public-rt-------#
resource "aws_route_table" "terraform_rt_pub" {
    vpc_id = aws_vpc.terraform_vpc.id
    tags =merge(var.tags, tomap({ "Name" = "${var.prefix}-pub-rt" }))
}

resource "aws_route_table_association" "terraform_rt_pub_sub" {
    count = length(var.availability_zones)
    
    route_table_id = aws_route_table.terraform_rt_pub.id
    subnet_id = element(aws_subnet.public.*.id, count.index)
}


resource "aws_route" "terraform_rt_pub_route" {
    route_table_id = aws_route_table.terraform_rt_pub.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform_igw.id  
}

#--------private-rt-------#

resource "aws_route_table" "terraform_rt_pri" {
    count = length(var.availability_zones)
    vpc_id = aws_vpc.terraform_vpc.id
    tags =merge(var.tags, tomap({ "Name" = "${var.prefix}-pri-rt-${count.index}" }))
}

resource "aws_route_table_association" "terraform_rt_pri_web" {
    count = length(var.availability_zones)
    route_table_id = element(aws_route_table.terraform_rt_pri.*.id, count.index)
    subnet_id = element(aws_subnet.private_web.*.id, count.index)
}
resource "aws_route_table_association" "terraform_rt_pri_was" {
    count = length(var.availability_zones)
    route_table_id = element(aws_route_table.terraform_rt_pri.*.id, count.index)
    subnet_id = element(aws_subnet.private_was.*.id, count.index)
}

resource "aws_route_table_association" "terraform_rt_pri_db" {
    count = length(var.availability_zones)
    route_table_id = element(aws_route_table.terraform_rt_pri.*.id, count.index)
    subnet_id = element(aws_subnet.private_db.*.id, count.index)
}

resource "aws_route" "terraform_rt_pri_route" {
    count = length(var.availability_zones)

    route_table_id = element(aws_route_table.terraform_rt_pri.*.id, count.index)
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = element(aws_nat_gateway.terraform_nat.*.id, count.index)
}