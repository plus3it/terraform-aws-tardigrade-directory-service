variable "create_directory_service" {
  description = "Controls whether to create the directory service"
  type        = bool
  default     = true
}

variable "name" {
  description = "The fully qualified name for the directory, such as corp.example.com"
  type        = string
}

variable "password" {
  description = "The password for the directory administrator or connector user"
  type        = string
}

variable "size" {
  description = "The size of the directory (Small or Large)"
  type        = string
}

variable "vpc_id" {
  description = "The identifier of the VPC that the directory is in"
  type        = string
}

variable "subnet_ids" {
  description = "The identifiers of the subnets for the directory servers (2 subnets in 2 different AZs)"
  type        = list(string)
}

variable "connect_settings" {
  description = "Connector related information about the directory (required for ADConnector)"
  type        = list(string)
  default     = []
}

variable "alias" {
  description = "The alias for the directory, unique amongst all aliases in AWS (required for enable_sso)"
  type        = string
  default     = null
}

variable "description" {
  description = "A textual description for the directory"
  type        = string
  default     = null
}

variable "short_name" {
  description = "The short name of the directory, such as CORP"
  type        = string
  default     = null
}

variable "enable_sso" {
  description = "Whether to enable single-sign on for the directory (requires alias)"
  default     = false
}

variable "type" {
  description = "Either SimpleAD, ADConnector or MicrosoftAD"
  type        = string
  default     = "SimpleAD"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

