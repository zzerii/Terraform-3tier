variable "security_group_filters" {
  description = "A list of security group IDs to associate with."
  type = map(list(string))
}
