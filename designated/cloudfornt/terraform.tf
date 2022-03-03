terraform {
  required_version = ">= 1.1.2"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.39"
    }
  }

  # backend "s3" {
  #   bucket = "truefriend-terraform-state-backend" # S3 bucket 이름 변경(필요 시)
  #   key = "${Account_ID}/${Prefix}/${Line_up}/${Service_name}/terraform.state"
  #   region = "ap-northeast-2"
  #   dynamodb_table = "terraform-state-locks" # 다이나모 테이블 이름 변경(필요 시)
  #   encrypt = true
  # }

}