# data "aws_region" "current" {}

# data "aws_caller_identity" "current" {}


data "aws_s3_bucket" "s3_origin" {
    provider    = aws.s3  # set provider
    bucket      = "cf-test-bucket-chaelin"
}

data "aws_cloudfront_cache_policy" "cachingoptimized" {
  name = "Managed-CachingOptimized"
}

data "aws_cloudfront_cache_policy" "cachingdisabled" {
  name = "Managed-CachingDisabled"
}

data "aws_cloudfront_origin_request_policy" "allviewer" {
    name = "Managed-AllViewer"
}

data "aws_cloudfront_origin_request_policy" "cors3origin" {
    name = "Managed-CORS-S3Origin"
}

data "aws_cloudfront_response_headers_policy" "simplecors" {
  name = "Managed-SimpleCORS"
}

data "aws_wafv2_web_acl" "dev-waf" {
    name    = var.web_acl_name
    scope   = "CLOUDFRONT"
}

data "aws_acm_certificate" "cf_acm" {
    domain   = "zzerii.site"
  statuses   = ["ISSUED"]
}