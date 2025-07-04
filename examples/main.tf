provider "azurerm" {
  features {}
  subscription_id = "subscription-id"
}

module "ipam_pools" {
  source                                      = "../"
  virtual_network_manager_name                = "example-vnm"
  virtual_network_manager_resource_group_name = "example-rg"

  ipam_pools = {
    name                  = "main-pool-1"
    display_name          = "Main-Pool-1"
    main_address_prefixes = ["11.0.0.0/16", "11.1.0.0/16"]
    child_pools = {
      child1 = {
        display_name     = "Child-Pool-1"
        address_prefixes = ["11.0.1.0/24", "11.0.2.0/24"]
      }
      child2 = {
        display_name     = "Child-Pool-2"
        address_prefixes = ["11.1.1.0/24", "11.1.2.0/24"]
      }
    }
  }
}


# Create a virtual network that uses the IPAM pools created by the module
resource "azurerm_virtual_network" "this" {
  name                = "example-vnet"
  location            = "westeurope"
  resource_group_name = "example-rg"
  ip_address_pool {
    id                     = module.ipam_pools.ipam_child_pools["child1"].id
    number_of_ip_addresses = 256
  }
}