account_id = "123456789012" # 아이디 변경 필수

cf_region = "us-east-1"
s3_region = "ap-northeast-2"
prefix = "dev"

# Cloudfront Origin Access Identity
oai_comment = "cf oai"

#Cloudfront 배포 상태
enabled                     = true

# 배포 생성
s3_origin_id                = "cf-test-bucket-chaelin"
s3_origin_path              = ""

shield_enabled              = false  #Origin shield 활성화 여부
# origin_shield_region      = "지역 코드"   # enables = true 일 경우

connection_attempts         = 3
connection_timeout          = 10
path_pattern                = "*.html"  #경로 패턴
compress                    = true  #자동 압축

viewer_protocol_policy      = "allow-all"  #allow-all/https-only/redirect-to-https

allowed_methods             = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
cached_methods              = [ "GET", "HEAD" ]
target_origin_id            = "cf-test-bucket-chaelin"


#응답 헤더 정책
smooth_streaming            = false


# 사용시 ARN입력
# realtime_log_config_arn   =


# Settings
price_class                 = "PriceClass_All"  # PriceClass_All/PriceClass_200/PriceClass_100

restriction_type            = "whitelist"

locations                   = ["US", "CA", "GB", "DE"]

#WAF WEB ACL (arn)
web_acl_name                = "dev-test-waf"

# 대체 도메인 이름 (CNAME)
aliases                     = ["zzerii.site", "www.zzerii.site"]

ssl_support_method          = "sni-only"
# Custom SSL certificate
minimum_protocol_version    = "TLSv1"

# 배포에서 지원할 최대 http 버전
http_version                = "http2"

default_root_object         = "index.html"

# 표준 로깅 (설정 시)
include_cookies             = false
bucket                      = ""
log_prefix                  = ""

is_ipv6_enabled             = true
comment                     = ""
