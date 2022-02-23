module "ec2" {
    source      = "../../module/ec2"

    region = var.region

    prefix = var.prefix

    add_instance = var.add_instance

    tags = var.tags  
}