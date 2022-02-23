region    = "ap-northeast-2"

vpc_name = "vpc-test"

prefix = "dev"

vpc_cidr  = "10.0.0.0/16"

availability_zones = ["ap-northeast-2a", "ap-northeast-2c"]

az = ["2a", "2c"]

enable_internet_gateway = true
enable_nat_gateway = true 


subnets = {
    public = { 
        cidr = ["10.0.11.0/24", "10.0.21.0/24"],
        ipv4_type = "public"
    },
    
    web = {
        cidr = ["10.0.12.0/24", "10.0.22.0/24"],
        ipv4_type = "private "
    },

    was = {
        cidr = ["10.0.13.0/24", "10.0.23.0/24"],
        ipv4_type = "private "
    },

    db = {
        cidr = ["10.0.14.0/24", "10.0.24.0/24"],
        ipv4_type = "private "
    },
}



tags={
    "CreatedByTerraform" = "True"
    }