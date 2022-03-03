provider "aws" {
   region = var.cf_region
}

# s3 alias aws provider
provider "aws" {
  alias   = "s3"
  region  = var.s3_region
}