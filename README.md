# terraform-aws-tardigrade-directory-service

Terraform module to create a directory

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| alias | The alias for the directory, unique amongst all aliases in AWS (required for enable_sso) | string | `""` | no |
| connect\_settings | Connector related information about the directory (required for ADConnector) | list | `<list>` | no |
| create\_directory\_service | Controls whether to create the directory service | string | `"false"` | no |
| description | A textual description for the directory | string | `""` | no |
| enable\_sso | Whether to enable single-sign on for the directory (requires alias) | string | `"false"` | no |
| name | The fully qualified name for the directory, such as corp.example.com | string | n/a | yes |
| password | The password for the directory administrator or connector user | string | n/a | yes |
| short\_name | The short name of the directory, such as CORP | string | `""` | no |
| size | The size of the directory (Small or Large) | string | n/a | yes |
| subnet\_ids | The identifiers of the subnets for the directory servers (2 subnets in 2 different AZs) | list | n/a | yes |
| tags | A mapping of tags to assign to the resource | map | `<map>` | no |
| type | Either SimpleAD, ADConnector or MicrosoftAD | string | `"SimpleAD"` | no |
| vpc\_id | The identifier of the VPC that the directory is in | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| access\_url | The access URL for the directory |
| dns\_ip\_addresses | A list of IP addresses of the DNS servers for the directory or connector |
| id | The ID of the directory |
| security\_group\_id | The ID of the security group created by the directory |

