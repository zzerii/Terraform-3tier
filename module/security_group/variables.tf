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

variable "rules_cidr" {
  type = list(object({
    security_group_id = string
    type = string
    from_port = string
    to_port = string
    protocol = string
    cidr_blocks = list(string) 
  }))
}
variable "rules_sg" {
  type = list(object({
    security_group_id = string
    type = string
    from_port = string
    to_port = string
    protocol = string
    source_security_group_id = string   
  }))
}


# variable "sg_id" {
#     type = map(string)
#     default = {}
  
# }

variable "tags" {
    type = map(string)
    default = {}
}

variable "sg_id" {
    type = list(string)
    default = []
}

variable "sg_map" {
    type = map(string)
    default = {}
}