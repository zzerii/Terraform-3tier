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

variable "rules_list" {
    type = list(string)
    default = []
}

variable "rules" {
  type = list(object({
    type = string
    from_port = string
    to_port = string
    protocol = string
    cidr_blocks = list(string)
    ipv6_cidr_blocks = list(string)
    source_security_group_id = list(string)   
  }))
}


variable "sg_id" {
    type = map(string)
    default = {}
  
}

variable "tags" {
    type = map(string)
    default = {}
}