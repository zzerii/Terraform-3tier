region = "ap-northeast-2"
prefix = "dev"

add_instance = {
    bastion = {
            instance_type          = "t2.micro"
            key_name               = "test"
            iam_instance_profile   = ""
            subnet_id            = "subnet-09a444963e4cade19"
            security_groups = ["sg-059522d87530cc6e5"]
            ebs_optimized          = false
            associate_public_ip_address = true
            az ="2a"
            volume_type = "gp3"
            volume_size = "8"
            user_data = "sudo yum update -y"
         },
    web-2a = {
            instance_type          = "t2.micro"
            key_name               = "test"
            iam_instance_profile   = ""
            subnet_id            = "subnet-0840cad36b7df4b83"
            security_groups = ["sg-052853352fd6ad384"]
            ebs_optimized          = false
            associate_public_ip_address = false
            az ="2a"
            volume_type = "gp3"
            volume_size = "8"
            user_data = "sudo yum update -y | sudo yum install -y httpd| sudo systemctl enable httpd --now"
        },
    web-2c = {
            instance_type          = "t2.micro"
            key_name               = "test"
            iam_instance_profile   = ""
            subnet_id            = "subnet-086ec098a656237d0"
            security_groups = ["sg-052853352fd6ad384"]
            ebs_optimized          = false
            associate_public_ip_address = false
            az ="2c"
            volume_type = "gp3"
            volume_size = "8"
            user_data = "sudo yum update -y | sudo yum install -y httpd| sudo systemctl enable httpd --now "
        },
    was-2a = {
            instance_type          = "t2.micro"
            key_name               = "test"
            iam_instance_profile   = ""
            subnet_id            = "subnet-09d1b549afb1e2796"
            security_groups = ["sg-0cd7486398df6c437"]
            ebs_optimized          = false
            associate_public_ip_address = false
            az ="2a"
            volume_type = "gp3"
            volume_size = "8"
            user_data = "sudo yum update -y | sudo yum install -y php "
        },
    was-2c = {
            instance_type          = "t2.micro"
            key_name               = "test"
            iam_instance_profile   = ""
            subnet_id            = "subnet-09f725b8382ceec08"
            security_groups = ["sg-0cd7486398df6c437"]
            ebs_optimized          = false
            associate_public_ip_address = false
            az ="2c"
            volume_type = "gp3"
            volume_size = "8"
            user_data = "sudo yum update -y | sudo yum install -y php "
        }
    }

tags = {
    "CreatedByTerraform" = "True"
    }