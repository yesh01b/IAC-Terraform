## Provisioing Resources using Terraform into Azure Cloud

1. Using the Terraform version "1.12.1", older version "1.9.6" 0r "1.7.0"
2. Backend or State file configuration "local"
3. Provider "Microsoft Azure" and version ">=4.0.0", older version ">= 3.38.6"

## Commands
1. Terraform Init
2. Terraform validate
3. Terraform Fmt
4. Terraform plan -var-file="tf-dev-uks-01.tfvars" -out=rg
5. Terraform apply rg