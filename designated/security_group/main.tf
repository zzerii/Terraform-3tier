module "sg_module" {
    source = "../../module/security_group"

    region  = var.region
    prefix  = var.prefix

    vpc_id  = data.aws_vpc.vpc.id

    rules   = var.rules


    tags    = var.tags
}