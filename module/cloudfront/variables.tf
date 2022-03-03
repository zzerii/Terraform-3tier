variable "account_id" {
  description = "Allowed AWS account IDs"
  type = string
}


variable "cf_region" {
    type    = string
    default = ""
}
variable "s3_region" {
    type    = string
    default = ""
}

variable "prefix" {
    type    = string
    default = ""
}

variable "oai_comment" {
    type    = string
    default = ""
}

variable "domain_name" {
    type    = string
    default = ""
}

variable "s3_origin_id" {
    type    = string
    default = ""
}

variable "s3_origin_path" {
    type    = string
    default = ""
}

variable "enabled" {
    type    = bool
    default = true
}

variable "shield_enabled" {
    type    = bool
    default = false
}

variable "origin_shield_region" {
    type    = string
    default = ""
  
}

variable "connection_attempts" {
    type    = number
    default = 3
}

variable "connection_timeout" {
    type    = number
    default = 10
}

variable "path_pattern" {
    type    = string
    default = ""
}

variable "compress" {
    type    = bool
    default = true
}

variable "viewer_protocol_policy" {
    type    = string
    default = ""
}

variable "allowed_methods" {
    type    = list(string)
    default = []
}

variable "cached_methods" {
    type    = list(string)
    default = []  
}

variable "target_origin_id" {
    type    = string
    default = ""
}

variable "cache_policy_id" {
    type    = string
    default = ""
}

variable "origin_request_policy_id" {
    type    = string
    default = ""
}

variable "response_headers_policy_id" {
    type    = string
    default = ""
}

variable "smooth_streaming" {
    type    = bool
    default = false
}

variable "price_class" {
    type    = string
    default = ""
}

variable "restriction_type" {
    type = string
    default = ""
}

variable "locations" {
    type = list(string)
    default = []
}


variable "web_acl_id" {
    type    = string
    default = ""
}

variable "aliases" {
    type    = list(string)
    default = []
}

variable "acm_certificate_arn" {
    type    = string
    default = ""
}

variable "ssl_support_method" {
    type = string
    default = ""
  
}

variable "minimum_protocol_version" {
    type    = string
    default = ""
}

variable "http_version" {
    type    = string
    default = ""
}

variable "default_root_object" {
    type    = string
    default = ""
}

variable "include_cookies" {
    type    = bool
    default = false
}

variable "bucket" {
    type    = string
    default = ""
}

variable "log_prefix" {
    type    = string
    default = ""
}

variable "is_ipv6_enabled" {
    type    = bool
    default = true
}

variable "comment" {
    type    = string
    default = ""
}
