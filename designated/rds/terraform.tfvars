region= "ap-northeast-2"
prefix = "dev"

#Parameter Group
param  = {
        dev_param={
            param_name = "param-group"
            param_family= "mysql5.7"

            character_set_server = "utf8"
            character_set_client = "utf8"
        }
    }

subnet_group = {
        dev_sub = {
            sub_group_name  = "sub-group"
            sub_name = ["dev-pri-db-0","dev-pri-db-1"]
            }
    }

db_instance = {
    dev_db = {
        identifier = "devdb"
        engine               = "mysql"
        engine_version       = "5.7.37"
        instance_class       = "db.t3.micro"
        storage_type = "gp2"
        allocated_storage    = 10
        max_allocated_storage = 20
        multi_az = true
        db_subnet_group_name = "dev-db-sub-group"
        publicly_accessible = false
        port =3306
        vpc_security_group_name =["dev-db-sg"]
        name                 = "devdb"
        username             = "admin"
        password             = "Admin123!"
        parameter_group_name = "dev-db-param-group"
        backup_retention_period      = 7
    
        copy_tags_to_snapshot = false
        skip_final_snapshot  = true
    }
}