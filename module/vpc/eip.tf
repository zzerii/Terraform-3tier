
####################
#--------EIP-------#
####################

resource "aws_eip" "terraform_nat_eip" {
    count = length(var.availability_zones)
    vpc   = true
    lifecycle {
        create_before_destroy = true
    }
    tags =merge(var.tags, tomap({ "Name" = "${var.prefix}-nat-eip-${var.az[count.index]}" }))
}