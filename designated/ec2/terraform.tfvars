region = "ap-northeast-2"
prefix = "dev"

add_instance = {
    bastion = {
            instance_type          = "t2.micro"
            key_name               = "terraform"
            iam_instance_profile   = ""
            subnet_id            = "subnet-0d3ff0d76c655f788"
            security_groups = ["sg-04e51be960f7e3075"]
            ebs_optimized          = false
            associate_public_ip_address = true
            az ="2a"
            volume_type = "gp3"
            volume_size = "8"
            user_data = "sudo yum update -y"
         },
    web-2a = {
            instance_type          = "t2.micro"
            key_name               = "terraform"
            iam_instance_profile   = ""
            subnet_id              = "subnet-0cc69d62a6e7314c7"
            security_groups = ["sg-0205a2ce693ab5e6a"]
            ebs_optimized          = false
            associate_public_ip_address = false
            az ="2a"
            volume_type = "gp3"
            volume_size = "8"
            user_data = "sudo yum update -y | sudo yum install -y httpd| sudo systemctl enable httpd --now"
        },
    web-2c = {
            instance_type          = "t2.micro"
            key_name               = "terraform"
            iam_instance_profile   = ""
            subnet_id              = "subnet-0e0c01783312d6aa0"
            security_groups = ["sg-0205a2ce693ab5e6a"]
            ebs_optimized          = false
            associate_public_ip_address = false
            az ="2c"
            volume_type = "gp3"
            volume_size = "8"
            user_data = "sudo yum update -y | sudo yum install -y httpd| sudo systemctl enable httpd --now "
        },
    was-2a = {
            instance_type          = "t2.micro"
            key_name               = "terraform"
            iam_instance_profile   = ""
            subnet_id              = "subnet-0b731689237f9af65"
            security_groups = ["sg-0818c596c1c96f8c9"]
            ebs_optimized          = false
            associate_public_ip_address = false
            az ="2a"
            volume_type = "gp3"
            volume_size = "8"
            user_data = "sudo yum update -y | sudo yum install -y php "
        },
    was-2c = {
            instance_type          = "t2.micro"
            key_name               = "terraform"
            iam_instance_profile   = ""
            subnet_id              = "subnet-0de439b971f97e321"
            security_groups = ["sg-0818c596c1c96f8c9"]
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