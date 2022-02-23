variable "region" {
    type = string
    default = ""
}

variable "prefix" {
    type = string
    default = ""
}

variable "add_instance" {
    type = map(object({
        instance_type = string
        key_name = string
        iam_instance_profile = string
        subnet_id = string
        security_groups = list(string)
        ebs_optimized = bool
        associate_public_ip_address = bool
        az = string
        volume_type = string
        volume_size = string
        user_data = string
    }))
    default = {}
}

variable "tags" {
    type = map(string)
    default = {}
}