data "aws_vpc" "vpc" {
    tags = {
      "Name" = "dev-vpc-test"
    }
}