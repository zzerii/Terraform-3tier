region = "ap-northeast-2"
prefix = "dev"

add_instance = [
   {
        name = "bastion"
        instance_type          = "t2.micro"
        key_name               = "test"
        iam_instance_profile   = ""
        subnet_id            = "dev-pub-2a"
        security_groups = "dev-bastion-sg"
        ebs_optimized          = false
        associate_public_ip_address = true
        az ="2a"
        volume_type = "gp3"
        volume_size = "8"
        user_data = "sudo yum update -y"
    },
    {
        name = "web-2a"
        instance_type          = "t2.micro"
        key_name               = "test"
        iam_instance_profile   = ""
        subnet_id            = "dev-pri-web-2a"
        security_groups = "dev-web-sg"
        ebs_optimized          = false
        associate_public_ip_address = false
        az ="2a"
        volume_type = "gp3"
        volume_size = "8"
        user_data = "sudo yum update -y | sudo yum install -y httpd| sudo systemctl enable httpd --now"
    },
    {
        name = "web-2c"
        instance_type          = "t2.micro"
        key_name               = "test"
        iam_instance_profile   = ""
        subnet_id            = "dev-pri-web-2c"
        security_groups = "dev-web-sg"
        ebs_optimized          = false
        associate_public_ip_address = false
        az ="2c"
        volume_type = "gp3"
        volume_size = "8"
        user_data = "sudo yum update -y | sudo yum install -y httpd| sudo systemctl enable httpd --now "
    },
    {
        name = "was-2a"
        instance_type          = "t2.micro"
        key_name               = "test"
        iam_instance_profile   = ""
        subnet_id            = "dev-pri-was-2a"
        security_groups = "dev-was-sg"
        ebs_optimized          = false
        associate_public_ip_address = false
        az ="2a"
        volume_type = "gp3"
        volume_size = "8"
        user_data = "sudo yum update -y | sudo yum install -y php "
    },
    {
        name = "was-2c"
        instance_type          = "t2.micro"
        key_name               = "test"
        iam_instance_profile   = ""
        subnet_id            = "dev-pri-was-2c"
        security_groups = "dev-was-sg"
        ebs_optimized          = false
        associate_public_ip_address = false
        az ="2c"
        volume_type = "gp3"
        volume_size = "8"
        user_data = "sudo yum update -y | sudo yum install -y php "
    }
    ]

tags = {
    "CreatedByTerraform" = "True"
    }