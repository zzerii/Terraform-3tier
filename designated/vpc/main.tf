module "terraform_vpc" {

    source      = "../../module/vpc"
    region      = var.region
    prefix      = var.prefix

    vpc_name    = var.vpc_name
    vpc_cidr    = var.vpc_cidr

    availability_zones  = var.availability_zones
    az=var.az

    enable_nat_gateway = var.enable_nat_gateway
    enable_internet_gateway = var.enable_internet_gateway

    subnets = var.subnets


#--------tags-------#
    tags    = var.tags
}