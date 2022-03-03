# resource "null_resource" "validate_account" {
#   count = var.current_id == var.account_id ? 0 : "Please check that you are using the AWS account"
# }

# resource "null_resource" "validate_module_name" {
#   count = local.module_name == var.tags["TerraformModuleName"] ? 0 : "Please check that you are using the Terraform module"
# }

# resource "null_resource" "validate_module_version" {
#   count = local.module_version == var.tags["TerraformModuleVersion"] ? 0 : "Please check that you are using the Terraform module"
# }



# Static caching

# Cloudfront Origin Access Identity 
# resource "aws_cloudfront_origin_access_identity" "cf_oai" {
#     comment = var.oai_comment
# }

# 배포 생성
resource "aws_cloudfront_distribution" "cloudfront" {
    # ORIGIN 
    origin {
        domain_name = var.domain_name
        origin_id   = var.s3_origin_id
        origin_path = var.s3_origin_path

        #OAI 지정
        # s3_origin_config {
        #     origin_access_identity = aws_cloudfront_origin_access_identity.cf_oai.cloudfront_access_identity_path
        # }

        # Origin Shield 사용
        # origin_shield {
        #     #Origin shield 활성화 여부
        #     enabled                = var.shield_enabled
        #     origin_shield_region   = var.origin_shield_region
        # }
        
    }
    
    connection {
      connection_attempts  = var.connection_attempts
      connection_timeout   = var.connection_timeout
    }

    #Defalut Cache Behavior#  따로 빼고 반복

    ## 캐시 정책

    #기본 동작 설정
    default_cache_behavior {
        viewer_protocol_policy      = var.viewer_protocol_policy

        allowed_methods             = var.allowed_methods
        cached_methods              = var.cached_methods

        target_origin_id            = var.target_origin_id
        cache_policy_id             = var.cache_policy_id
        origin_request_policy_id    = var.origin_request_policy_id

        response_headers_policy_id  = var.response_headers_policy_id
        smooth_streaming            = var.smooth_streaming

        # 사용시 ARN입력
        # realtime_log_config_arn   = var.realtime_log_config_arn
    }

    #생성 순서대로 우선순위 0 
    ordered_cache_behavior {
        path_pattern                = var.path_pattern
        compress                    = var.compress

        viewer_protocol_policy      = var.viewer_protocol_policy
        
        allowed_methods             = var.allowed_methods
        cached_methods              = var.cached_methods
        target_origin_id            = var.target_origin_id

        cache_policy_id             = var.cache_policy_id
        origin_request_policy_id    = var.origin_request_policy_id

        response_headers_policy_id  = var.response_headers_policy_id
        smooth_streaming            = var.smooth_streaming

        # 사용시 ARN입력
        # realtime_log_config_arn   = var.realtime_log_config_arn
    }

    # 함수 연결 


    # 설정 
    price_class = var.price_class

    restrictions {
    geo_restriction {
      restriction_type = var.restriction_type
      locations        = var.locations
    }
  }

    web_acl_id  = var.web_acl_id

    aliases     = var.aliases


    # Custom SSL certificate
    viewer_certificate {
      acm_certificate_arn       = var.acm_certificate_arn
      ssl_support_method        = var.ssl_support_method
      minimum_protocol_version  = var.minimum_protocol_version
    }

    http_version        = var.http_version
    default_root_object = var.default_root_object

    # 표준 로깅 (설정 시)
    # logging_config {
    #     include_cookies   = var.include_cookies
    #     bucket            = var.bucket
    #     prefix            = var.log_prefix
    # }

    is_ipv6_enabled = var.is_ipv6_enabled
    comment         = var.comment

    enabled         = var.enabled
}