provider "aws" {}

resource "aws_directory_service_directory" "this" {
  count = "${var.create_directory_service ? 1 : 0}"

  name        = "${var.name}"
  short_name  = "${var.short_name}"
  password    = "${var.password}"
  size        = "${var.size}"
  type        = "${var.type}"
  alias       = "${var.alias}"
  description = "${var.description}"
  enable_sso  = "${var.enable_sso}"

  vpc_settings {
    vpc_id     = "${var.vpc_id}"
    subnet_ids = "${var.subnet_ids}"
  }

  connect_settings = "${var.connect_settings}"

  tags = "${var.tags}"
}
