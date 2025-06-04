## Terraform version configuration

terraform {
  required_version = "1.9.6"
}

## State file configuration
terraform {
  backend "local" {
    path = "../terraform/terraform.tfstate"
  }
}