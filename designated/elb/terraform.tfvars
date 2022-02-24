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
    # subnets         = ["subnet-0d3ff0d76c655f788","subnet-0c301873dd9538553"]
    subnets = ["dev-pub-2a", "dev-pub-2c"]
    enable_deletion_protection = true
}

web_alb_tg ={
    name     = "dev-web-alb-target-group"
    port     = 80
    protocol = "HTTP"
    # vpc_name   = "vpc-0dc16bf91129f71f8"
    vpc_name  = "dev-vpc-test"
    interval            = 30
    path                = "/"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    target_id = ["i-0d1f4a2e34b0ff01f", "i-06ec888bc441f01dd"]
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
    # subnets         = ["subnet-0cc69d62a6e7314c7","subnet-0e0c01783312d6aa0"]
    subnets         = ["dev-pri-web-2a","dev-pri-web-2c"]
    enable_deletion_protection = true

}

was_alb_tg ={
    name     = "dev-was-alb-target-group"
    port     = 80
    protocol = "HTTP"
    # vpc_name   = "vpc-0dc16bf91129f71f8"
    vpc_name  = "dev-vpc-test"
    interval            = 30
    path                = "/"
    healthy_threshold   = 3
    unhealthy_threshold = 3

    target_id = ["i-082bef12b87e7d857", "i-045cffec6464923e3"]
    }

was_alb_listener = {
    load_balancer_arn = ""
    port              = 80
    protocol          = "HTTP"

    target_group_arn = ""
    type             = "forward"
}
