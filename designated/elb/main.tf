module "elb" {
    source = "./elb_module"

    region = var.region
    prefix = var.prefix

    vpc_id = data.aws_vpc.vpc.id

    web_alb = var.web_alb
    web_alb_tg = var.web_alb_tg
    web_alb_listener = var.web_alb_listener

    was_alb = var.was_alb
    was_alb_tg = var.was_alb_tg
    was_alb_listener = var.was_alb_listener 
}