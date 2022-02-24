region  = "ap-northeast-2"
prefix  = "dev"

vpc_name = "dev-vpc-test"

rules_list=["bastion", "web_elb", "web", "was_elb", "was", "db"]

rules_cidr =[
    {
        security_group_id = "bastion"
        type = "ingress"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["220.71.58.172/32"]
    },
    {
        security_group_id = "web_elb"
        type = "ingress"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
]

rules_sg = [
    {
        security_group_id = "web"
        type = "ingress"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        source_security_group_id = "web_elb"
    },
    {
        security_group_id = "web"
        type = "ingress"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        source_security_group_id = "bastion"
    },
    {
        security_group_id = "was_elb"
        type = "ingress"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        source_security_group_id = "web"
    },
    {
        security_group_id = "was"
        type = "ingress"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        source_security_group_id = "was_elb"
    },
    {
        security_group_id = "was"
        type = "ingress"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        source_security_group_id = "bastion"
    },
    {
        security_group_id = "db"
        type = "ingress"
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        source_security_group_id = "was"
    }

]

tags = {
    "CreatedByTerraform" = "true"
    }
