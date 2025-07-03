# terraform-azure-res-ipam

This Terraform module is designed to deploy IPAM (IP Address Management) pools into an existing Azure Virtual Network Manager. It simplifies the process of managing IP address spaces across multiple virtual networks in Azure.


## Requirements

- Terraform >= 1.0
- Azure Virtual Network Manager already configured.

## License

This module is licensed under the MIT License. See [LICENSE](LICENSE) for details.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.35.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_manager_ipam_pool.child_pools](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_manager_ipam_pool) | resource |
| [azurerm_network_manager_ipam_pool.parent_pools](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_manager_ipam_pool) | resource |
| [azurerm_network_manager.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/network_manager) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ipam_pools"></a> [ipam\_pools](#input\_ipam\_pools) | Configuration for IPAM pools | <pre>object({<br/>    name                  = string<br/>    display_name          = string<br/>    main_address_prefixes = list(string)<br/>    child_pools = map(object({<br/>      display_name     = string<br/>      address_prefixes = list(string)<br/>    }))<br/>  })</pre> | n/a | yes |
| <a name="input_virtual_network_manager_name"></a> [virtual\_network\_manager\_name](#input\_virtual\_network\_manager\_name) | Name of the Virtual Network Manager | `string` | n/a | yes |
| <a name="input_virtual_network_manager_resource_group_name"></a> [virtual\_network\_manager\_resource\_group\_name](#input\_virtual\_network\_manager\_resource\_group\_name) | Name of the resource group for the Virtual Network Manager | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ipam_child_pools"></a> [ipam\_child\_pools](#output\_ipam\_child\_pools) | The child IPAM pools created in the Virtual Network Manager. |
| <a name="output_ipam_parent_pools"></a> [ipam\_parent\_pools](#output\_ipam\_parent\_pools) | The parent IPAM pool created in the Virtual Network Manager. |
<!-- END_TF_DOCS -->