variable "virtual_network_manager_name" {
  description = "Name of the Virtual Network Manager"
  type        = string
}

variable "virtual_network_manager_resource_group_name" {
  description = "Name of the resource group for the Virtual Network Manager"
  type        = string
}

variable "ipam_pools" {
  description = "Configuration for IPAM pools"
  type = object({
    name                  = string
    display_name          = string
    main_address_prefixes = list(string)
    child_pools = map(object({
      display_name     = string
      address_prefixes = list(string)
    }))
  })
}
