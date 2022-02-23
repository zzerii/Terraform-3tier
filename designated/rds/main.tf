module "rds" {
    source = "../../module/rds"

    region = var.region

    prefix = var.prefix

    param = var.param

    subnet_group = var.subnet_group

    db_instance = var.db_instance
  
}