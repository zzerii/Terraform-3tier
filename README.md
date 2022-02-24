# Terraform-3tier


### ✔️ Terraform 으로 구성한 AWS 3tier 아키텍처
<img src="https://user-images.githubusercontent.com/61822411/155452459-c38533ae-3cf6-48c4-a7cf-5388f207c0fe.png"></img>

### ✖️ 실행 방법

`cd designate/*만들 Module*`

```
terraform init -get=true -upgrade -reconfigure
terraform plan -var-file=terraform.tfvars -refresh=false -out=planfile
terraform apply planfile
```

### ✖️ alias 설정
'terraform => tf'

```
vi ~/.bashrc
>>>
alias tf = 'terraform'
```
