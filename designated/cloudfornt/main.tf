module "cloudfront" {
    source      = "../../module/cloudfront"

    account_id = var.account_id

    # origin

    cf_region                       = var.cf_region
    s3_region                       = var.s3_region
    prefix                          = var.prefix

    oai_comment                     = var.oai_comment
    domain_name                     = data.aws_s3_bucket.s3_origin.bucket_domain_name

    s3_origin_id                    = var.s3_origin_id
    s3_origin_path                  = var.s3_origin_path

    enabled                         = var.enabled

    shield_enabled                  = var.shield_enabled
    origin_shield_region            = var.origin_shield_region

    connection_attempts             = var.connection_attempts
    connection_timeout              = var.connection_timeout

    # cache behavior
    path_pattern                    = var.path_pattern
    compress                        = var.compress
    viewer_protocol_policy          = var.viewer_protocol_policy

    allowed_methods                 = var.allowed_methods
    cached_methods                  = var.cached_methods
    target_origin_id                = var.target_origin_id

    cache_policy_id                 = data.aws_cloudfront_cache_policy.cachingoptimized.id
    origin_request_policy_id        = data.aws_cloudfront_origin_request_policy.allviewer.id
    
    response_headers_policy_id      = data.aws_cloudfront_response_headers_policy.simplecors.id
    smooth_streaming                = var.smooth_streaming

    #Setting

    price_class                     = var.price_class

    restriction_type                = var.restriction_type
    locations                       = var.locations

    web_acl_id                      = data.aws_wafv2_web_acl.dev-waf.arn

    aliases                         = var.aliases
    
    acm_certificate_arn             = data.aws_acm_certificate.cf_acm.arn
    ssl_support_method              = var.ssl_support_method
    minimum_protocol_version        = var.minimum_protocol_version

    http_version                    = var.http_version

    default_root_object             = var.default_root_object

    include_cookies                 = var.include_cookies
    bucket                          = var.bucket
    log_prefix                      = var.log_prefix

    is_ipv6_enabled                 = var.is_ipv6_enabled
    comment                         = var.comment
}