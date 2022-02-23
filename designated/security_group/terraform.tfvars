region  = "ap-northeast-2"
prefix  = "dev"

vpc_name = "dev-vpc-test"

rules_list=["bastion', 'web_elb", "web", "was_elb", "was", "db"]

rules =[
    {
        name = "bastion"
        type = "ingress"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["220.71.58.172/32"]
        ipv6_cidr_blocks = []
        source_security_group_id = []
    },
    {
        name = "web_elb"
        type = "ingress"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = []
        source_security_group_id = []
    },
    {
        name = "web"
        type = "ingress"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = []
        ipv6_cidr_blocks = []
        source_security_group_id = ["web_elb"]
    },
    {
        name = "web"
        type = "ingress"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = []
        ipv6_cidr_blocks = []
        source_security_group_id = ["bastion"]
    },
    {
        name = "was_elb"
        type = "ingress"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = []
        source_security_group_id = ["web"]
    },
    {
        name = "was"
        type = "ingress"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = []
        ipv6_cidr_blocks = []
        source_security_group_id = ["was_elb"]
    },
    {
        name = "was"
        type = "ingress"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = []
        ipv6_cidr_blocks = []
        source_security_group_id = ["bastion"]
    },
    {
        name = "db"
        type = "ingress"
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = []
        ipv6_cidr_blocks = []
        source_security_group_id = ["was"]
    }


]

/*
rules = {
    bastion = [
                {
                    type = "ingress"
                    from_port = 22
                    to_port = 22
                    protocol = "tcp"
                    cidr_blocks = ["220.71.58.172/32"]
                    ipv6_cidr_blocks = []
                    source_security_group_id = []
                }
            ],
    web-elb = [
            {
                type = "ingress"
                from_port = 80
                to_port = 80
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
                ipv6_cidr_blocks = []
                source_security_group_id = []
            }
        ]
    web = [
            {
                type = "ingress"
                from_port = 80
                to_port = 80
                protocol = "tcp"
                cidr_blocks = []
                ipv6_cidr_blocks = []
                source_security_group_id = []
            },
            {
                type = "ingress"
                from_port = 22
                to_port = 22
                protocol = "tcp"
                cidr_blocks = []
                ipv6_cidr_blocks = []
                source_security_group_id = []
            },
        ]
    was-elb = [
            {
                type = "ingress"
                from_port = 80
                to_port = 80
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
                ipv6_cidr_blocks = []
                source_security_group_id = []
            }
        ]
    was = [
            {
                type = "ingress"
                from_port = 80
                to_port = 80
                protocol = "tcp"
                cidr_blocks = []
                ipv6_cidr_blocks = []
                source_security_group_id = []
            },
            {
                type = "ingress"
                from_port = 22
                to_port = 22
                protocol = "tcp"
                cidr_blocks = []
                ipv6_cidr_blocks = []
                source_security_group_id = []
            },
        ]
    db = [
            {
                type = "ingress"
                from_port = [3306]
                to_port = [3306]
                protocol = "tcp"
                cidr_blocks = []
                ipv6_cidr_blocks = []
                source_security_group_id = []
            }

        ]
}
*/
tags = {
    "CreatedByTerraform" = "true"
    }