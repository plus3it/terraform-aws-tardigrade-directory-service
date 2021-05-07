# terraform-aws-tardigrade-directory-service

Terraform module to create a directory


<!-- BEGIN TFDOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_subnet.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | The fully qualified name for the directory, such as corp.example.com | `string` | n/a | yes |
| <a name="input_password"></a> [password](#input\_password) | The password for the directory administrator or connector user | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Subnet IDs for the directory servers/connectors (2 subnets in 2 different AZs) | `list(string)` | n/a | yes |
| <a name="input_alias"></a> [alias](#input\_alias) | The alias for the directory, unique amongst all aliases in AWS (required for enable\_sso) | `string` | `null` | no |
| <a name="input_connect_settings"></a> [connect\_settings](#input\_connect\_settings) | Connector related information about the directory (required for ADConnector) | <pre>object({<br>    # The username corresponding to the password provided.<br>    customer_username = string<br>    # The DNS IP addresses of the domain to connect to.<br>    customer_dns_ips = list(string)<br>  })</pre> | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | A textual description for the directory | `string` | `null` | no |
| <a name="input_edition"></a> [edition](#input\_edition) | (Required for the MicrosoftAD type only) The MicrosoftAD edition (Standard or Enterprise). | `string` | `null` | no |
| <a name="input_enable_sso"></a> [enable\_sso](#input\_enable\_sso) | Whether to enable single-sign on for the directory (requires alias) | `bool` | `false` | no |
| <a name="input_short_name"></a> [short\_name](#input\_short\_name) | The short name of the directory, such as CORP | `string` | `null` | no |
| <a name="input_size"></a> [size](#input\_size) | (Required for SimpleAD and ADConnector) The size of the directory (Small or Large) | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource | `map(string)` | `{}` | no |
| <a name="input_type"></a> [type](#input\_type) | Either SimpleAD, ADConnector or MicrosoftAD | `string` | `"SimpleAD"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_url"></a> [access\_url](#output\_access\_url) | The access URL for the directory |
| <a name="output_dns_ip_addresses"></a> [dns\_ip\_addresses](#output\_dns\_ip\_addresses) | A list of IP addresses of the DNS servers for the directory or connector |
| <a name="output_id"></a> [id](#output\_id) | The ID of the directory |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | The ID of the security group created by the directory |

<!-- END TFDOCS -->
