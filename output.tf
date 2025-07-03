output "ipam_parent_pools" {
  value       = azurerm_network_manager_ipam_pool.parent_pools
  description = "The parent IPAM pool created in the Virtual Network Manager."
}

output "ipam_child_pools" {
  value       = azurerm_network_manager_ipam_pool.child_pools
  description = "The child IPAM pools created in the Virtual Network Manager."
}