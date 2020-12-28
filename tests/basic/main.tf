provider "aws" {
  region = "us-east-1"
}

resource "random_string" "password" {
  length      = 10
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
  min_special = 1
}

resource "random_string" "domain" {
  length  = 10
  upper   = false
  number  = false
  special = false
}

module "vpc" {
  source = "github.com/terraform-aws-modules/terraform-aws-vpc?ref=v2.15.0"

  providers = {
    aws = aws
  }

  name            = "tardigrade-director-service-testing"
  cidr            = "10.0.0.0/16"
  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
}

module "directory_service" {
  source = "../../"
  providers = {
    aws = aws
  }

  name       = "corp.${random_string.domain.result}.com"
  password   = random_string.password.result
  size       = "Small"
  subnet_ids = module.vpc.private_subnets
  vpc_id     = module.vpc.vpc_id
}
