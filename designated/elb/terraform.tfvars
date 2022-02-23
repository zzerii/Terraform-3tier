region = "ap-northeast-2"
prefix = "dev"

vpc_name   = "dev-vpc-test"

#######################################
#WEB_ALB
#######################################

web_alb= {
    name            = "dev-web-alb"
    internal        = false
    security_groups = ["sg-0205a2ce693ab5e6a"]
    subnets         = ["subnet-0d3ff0d76c655f788","subnet-0c301873dd9538553"]
    enable_deletion_protection = true
}

web_alb_tg ={
    name     = "dev-web-alb-target-group"
    port     = 80
    protocol = "HTTP"
    vpc_name   = "vpc-0dc16bf91129f71f8"
    interval            = 30
    path                = "/"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    }

web_alb_listener = {
    load_balancer_arn = ""
    port              = 80
    protocol          = "HTTP"

    target_group_arn = ""
    type             = "forward"
}

#######################################
#WAS-ALB
#######################################
was_alb= {
    name            = "dev-was-alb"
    internal        = false
    security_groups = ["sg-0818c596c1c96f8c9"]
    subnets         = ["subnet-0cc69d62a6e7314c7","subnet-0e0c01783312d6aa0"]
    enable_deletion_protection = true

}

was_alb_tg ={
    name     = "dev-was-alb-target-group"
    port     = 80
    protocol = "HTTP"
    vpc_name   = "vpc-0dc16bf91129f71f8"
    interval            = 30
    path                = "/"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    }

was_alb_listener = {
    load_balancer_arn = ""
    port              = 80
    protocol          = "HTTP"

    target_group_arn = ""
    type             = "forward"
}
