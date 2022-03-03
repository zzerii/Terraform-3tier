/*
data "aws_security_groups" "this" {
    dynamic "filter" {
        for_each = var.security_group_filters
        iterator = tag
        content {
        name = "tag:${tag.key}"
        values = [
            tag.value
        ]
        }
    }
} 

 
data "aws_security_groups" "this" {
    dynamic "filter" {
        count = length(var.security_group_filters["Name"])
        content {
        name = "tag:$Name"
        values = [
            var.security_group_filters["Name"][count.index]
        ]
        }
    }
      
}
 
data "aws_security_groups" "this" {
dynamic "filter" {
    for_each = var.security_group_filters
    iterator = tag
    content {
    name = "tag:${tag.key}"
    values = tag.value["${tag.key}"]
        }
    } 
}
 


data "aws_security_groups" "this" {
    filter {
        name = "tag:${join("",keys(var.security_group_filters))}"
        values = var.security_group_filters[join("",keys(var.security_group_filters))]
        }  
}
*/

data "aws_security_groups" "this" {
dynamic "filter" {
    for_each = var.security_group_filters
    iterator = tag
    content {
    name = "tag:${tag.key}"
    values = tag.value
        }
    } 
}