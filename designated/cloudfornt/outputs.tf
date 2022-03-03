output "name" {
    value = module.cloudfront
}

output "test" {
    value = data.aws_s3_bucket.s3_origin.bucket_domain_name
  
}