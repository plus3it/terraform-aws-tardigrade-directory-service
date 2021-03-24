resource "aws_directory_service_directory" "this" {
  name        = var.name
  short_name  = var.short_name
  password    = var.password
  size        = var.size
  type        = var.type
  alias       = var.alias
  description = var.description
  enable_sso  = var.enable_sso
  edition     = var.edition
  tags        = var.tags

  dynamic "vpc_settings" {
    for_each = var.type != "ADConnector" ? ["1"] : []
    content {
      subnet_ids = var.subnet_ids
      vpc_id     = data.aws_subnet.this.vpc_id
    }
  }

  dynamic "connect_settings" {
    for_each = var.type == "ADConnector" ? [var.connect_settings] : []
    content {
      customer_dns_ips  = connect_settings.value.customer_dns_ips
      customer_username = connect_settings.value.customer_username
      subnet_ids        = var.subnet_ids
      vpc_id            = data.aws_subnet.this.vpc_id
    }
  }
}

data "aws_subnet" "this" {
  id = var.subnet_ids[0]
}
