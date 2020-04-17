provider "aws" {
}

resource "aws_directory_service_directory" "this" {
  count = var.create_directory_service ? 1 : 0

  name        = var.name
  short_name  = var.short_name
  password    = var.password
  size        = var.size
  type        = var.type
  alias       = var.alias
  description = var.description
  enable_sso  = var.enable_sso
  edition     = var.edition

  vpc_settings {
    vpc_id     = var.vpc_id
    subnet_ids = var.subnet_ids
  }

  dynamic "connect_settings" {
    for_each = var.connect_settings
    content {
      customer_dns_ips  = connect_settings.value.customer_dns_ips
      customer_username = connect_settings.value.customer_username
      subnet_ids        = connect_settings.value.subnet_ids
      vpc_id            = connect_settings.value.vpc_id
    }
  }

  tags = var.tags
}

