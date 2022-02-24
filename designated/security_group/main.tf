module "sg_module" {
    source = "../../module/security_group"

    region  = var.region
    prefix  = var.prefix

    vpc_id  = data.aws_vpc.vpc.id

    rules_list = var.rules_list
    rules_cidr   = var.rules_cidr
    rules_sg = var.rules_sg


    tags    = var.tags

    sg_id = module.sg_module.sg_id

}