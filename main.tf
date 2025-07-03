resource "azurerm_network_manager_ipam_pool" "parent_pools" {
  name               = var.ipam_pools.name
  location           = data.azurerm_network_manager.this.location
  network_manager_id = data.azurerm_network_manager.this.id
  display_name       = var.ipam_pools.display_name
  address_prefixes   = var.ipam_pools.main_address_prefixes
}

resource "azurerm_network_manager_ipam_pool" "child_pools" {
  depends_on = [azurerm_network_manager_ipam_pool.parent_pools]

  for_each = var.ipam_pools.child_pools

  name               = each.key
  location           = data.azurerm_network_manager.this.location
  network_manager_id = data.azurerm_network_manager.this.id
  display_name       = each.value.display_name
  address_prefixes   = each.value.address_prefixes
  parent_pool_name   = var.ipam_pools.display_name
}
