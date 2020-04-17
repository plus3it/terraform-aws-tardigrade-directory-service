# terraform-aws-tardigrade-directory-service

Terraform module to create a directory


<!-- BEGIN TFDOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | The fully qualified name for the directory, such as corp.example.com | `string` | n/a | yes |
| password | The password for the directory administrator or connector user | `string` | n/a | yes |
| subnet\_ids | The identifiers of the subnets for the directory servers (2 subnets in 2 different AZs) | `list(string)` | n/a | yes |
| vpc\_id | The identifier of the VPC that the directory is in | `string` | n/a | yes |
| alias | The alias for the directory, unique amongst all aliases in AWS (required for enable\_sso) | `string` | `null` | no |
| connect\_settings | Connector related information about the directory (required for ADConnector) | `list(string)` | `[]` | no |
| create\_directory\_service | Controls whether to create the directory service | `bool` | `true` | no |
| description | A textual description for the directory | `string` | `null` | no |
| edition | (Required for the MicrosoftAD type only) The MicrosoftAD edition (Standard or Enterprise). | `string` | `null` | no |
| enable\_sso | Whether to enable single-sign on for the directory (requires alias) | `bool` | `false` | no |
| short\_name | The short name of the directory, such as CORP | `string` | `null` | no |
| size | (Required for SimpleAD and ADConnector) The size of the directory (Small or Large) | `string` | `null` | no |
| tags | A mapping of tags to assign to the resource | `map(string)` | `{}` | no |
| type | Either SimpleAD, ADConnector or MicrosoftAD | `string` | `"SimpleAD"` | no |

## Outputs

| Name | Description |
|------|-------------|
| access\_url | The access URL for the directory |
| dns\_ip\_addresses | A list of IP addresses of the DNS servers for the directory or connector |
| id | The ID of the directory |
| security\_group\_id | The ID of the security group created by the directory |

<!-- END TFDOCS -->
