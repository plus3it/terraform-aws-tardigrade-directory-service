provider aws {
  region = "us-east-1"
}

module "no_create" {
  source = "../../"
  providers = {
    aws = aws
  }

  create_directory_service = false
  name                     = null
  password                 = null
  size                     = null
  subnet_ids               = null
  vpc_id                   = null
}
