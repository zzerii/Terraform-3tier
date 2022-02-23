variable "region" {
    type = string
    default = ""
}

variable "vpc_name" {
    type = string
    default = ""
}

variable "prefix" {
    type = string
    default = ""
  
}

variable "vpc_cidr" {
    type = string
    default = ""
}

variable "availability_zones" {
    type = list(string)
    default = []
}

variable "az" {
    type = list(string)
    default = []
}

variable "enable_internet_gateway" {
  type = string
  default = "false"
}

variable "enable_nat_gateway" {
  type = string
  default = "false"
}

variable "subnets" {
    type = map(any)
}


#--------tags-------#
variable "tags" {
    type = map(string)
    default = {}
}