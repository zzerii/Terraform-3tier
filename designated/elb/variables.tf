variable "region" {
    type = string
    default = ""
}

variable "prefix" {
    type = string
    default = ""
}
variable "vpc_name" {
    type = string
    default = ""
}

variable "vpc_id" {
    type = string
    default = ""
  
}



###############################
#WEB_ALB
###############################

variable "web_alb" {
    type = object({
        name = string
        internal = bool
        security_groups = list(string)
        subnets = list(string)

        enable_deletion_protection = bool
    })
    default = {
      enable_deletion_protection = false
      internal = false
      name = ""
      security_groups = []
      subnets = []
    }
}

variable "web_alb_tg" {
    type = object({
        name     = string
        port     = number
        protocol = string
        vpc_name   = string
        interval            = number
        path                = string
        healthy_threshold   = number
        unhealthy_threshold = number
    })
    default = {
      healthy_threshold = 1
      interval = 1
      name = ""
      path = ""
      port = 1
      protocol = ""
      unhealthy_threshold = 1
      vpc_name = ""
    }
}

variable "web_alb_listener" {
    type = object({
        load_balancer_arn = string
        port =  number
        protocol = string
        target_group_arn = string
        type = string
    })
    default = {
      load_balancer_arn = ""
      port = 1
      protocol = ""
      target_group_arn = ""
      type = ""
    }
}

###############################
#WAS_ALB
###############################

variable "was_alb" {
    type = object({
        name = string
        internal = bool
        security_groups = list(string)
        subnets = list(string)

        enable_deletion_protection = bool
    })
    default = {
      enable_deletion_protection = false
      internal = false
      name = ""
      security_groups = [ "" ]
      subnets = [ "" ]
    }
}

variable "was_alb_tg" {
    type = object({
        name     = string
        port     = number
        protocol = string
        vpc_name   = string
        interval            = number
        path                = string
        healthy_threshold   = number
        unhealthy_threshold = number
    })
    default = {
      healthy_threshold = 1
      interval = 1
      name = ""
      path = ""
      port = 1
      protocol = ""
      unhealthy_threshold = 1
      vpc_name = ""
    }
}

variable "was_alb_listener" {
    type = object({
        load_balancer_arn = string
        port =  number
        protocol = string
        target_group_arn = string
        type = string
    })
    default = {
      load_balancer_arn = ""
      port = 1
      protocol = ""
      target_group_arn = ""
      type = ""
    }
}