variable "region" {
    type = string
    default = ""
}

variable "prefix" {
    type = string
    default = ""
}

variable "param" {
    type=map(object({
        param_name = string 
        param_family= string

        character_set_server = string
        character_set_client = string
    }))
    default = {}
}

variable "subnet_group" {
    type=map(object({
        sub_group_name = string 
        sub_name=list(string)
    }))
    default = {}
}

variable "db_instance" {
    type=map(object({
        identifier           = string
        engine               = string
        engine_version       = string

        instance_class       = string
        storage_type = string
        allocated_storage    = number
        max_allocated_storage = number

        multi_az = bool

        db_subnet_group_name = string
        publicly_accessible = bool
        port =string
        vpc_security_group_name = list(string)

        name                 = string
        username             = string
        password             = string

        parameter_group_name = string

        backup_retention_period      = string
        copy_tags_to_snapshot = string
        skip_final_snapshot  = string
    }))
    default = {}
}