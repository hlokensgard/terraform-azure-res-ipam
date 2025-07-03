# Referencing an existing virtual network manager
data "azurerm_network_manager" "this" {
  name                = var.virtual_network_manager_name
  resource_group_name = var.virtual_network_manager_resource_group_name
}