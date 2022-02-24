region = "ap-northeast-2"
prefix = "dev"

vpc_name   = "dev-vpc-test"

#######################################
#WEB_ALB
#######################################

web_alb= {
    name            = "dev-web-alb"
    internal        = false
    security_groups = ["dev-web_elb-sg"]
     subnets = ["dev-pub-2a", "dev-pub-2c"]
    enable_deletion_protection = true
}

web_alb_tg ={
    name     = "dev-web-alb-target-group"
    port     = 80
    protocol = "HTTP"
    vpc_name  = "dev-vpc-test"
    interval            = 30
    path                = "/"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    target_id = ["dev-web-2a", "dev-web-2c"]
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
    security_groups = ["dev-was_elb-sg"]
    subnets         = ["dev-pri-web-2a","dev-pri-web-2c"]
    enable_deletion_protection = true

}

was_alb_tg ={
    name     = "dev-was-alb-target-group"
    port     = 80
    protocol = "HTTP"
    vpc_name  = "dev-vpc-test"
    interval            = 30
    path                = "/"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    target_id = ["dev-was-2a", "dev-was-2c"]
    }

was_alb_listener = {
    load_balancer_arn = ""
    port              = 80
    protocol          = "HTTP"

    target_group_arn = ""
    type             = "forward"
}
