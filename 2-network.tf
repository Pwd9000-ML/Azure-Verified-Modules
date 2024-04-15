
# Locals block to define the subnet names carve /24 address space into 4 subnets of equal size. (subnets: common, data, compute and web)
locals {
  subnet_names = ["common", "data", "compute", "web"]
  subnets = {
    for i in range(length(local.subnet_names)) : "${element(local.subnet_names, i)}" => {
      address_prefixes = [cidrsubnet(local.virtual_network_address_space, 2, i)]
    }
  }
  virtual_network_address_space = "10.4.0.0/24"
}

# Creating a virtual network with a unique name, telemetry settings, and in the specified resource group and location.
module "vnet" {
  source  = "Azure/avm-res-network-virtualnetwork/azurerm"
  version = "0.1.4"

  name                          = "avm-demo-vnet-${random_integer.number.result}"
  enable_telemetry              = true
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = "uksouth"
  subnets                       = local.subnets
  virtual_network_address_space = ["10.4.0.0/24"]
}

# Create Private DNS Zone for privatelink - Storage and keyvault (Add more to "For_each" if needed)
resource "azurerm_private_dns_zone" "privatelink" {
  for_each            = toset(["privatelink.blob.core.windows.net", "privatelink.vault.azure.net"])
  name                = each.key
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink" {
  for_each              = toset(["privatelink.blob.core.windows.net", "privatelink.vault.azure.net"])
  name                  = "vnetlink-${each.key}"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink[each.key].name
  virtual_network_id    = module.vnet.virtual_network_id
  registration_enabled  = false
}

# module "private_dns_zones" {
#   for_each = toset(["privatelink.blob.core.windows.net", "privatelink.vault.azure.net"])

#   source  = "Azure/avm-res-network-privatednszone/azurerm"
#   version = "0.1.1"

#   enable_telemetry    = true
#   resource_group_name = azurerm_resource_group.rg.name
#   domain_name         = each.key
#   virtual_network_links = {
#     vnetlinks = {
#       vnetlinkname     = "vnetlink-${each.key}"
#       vnetid           = module.vnet.virtual_network_id
#       autoregistration = false
#       tags             = {}
#     }
#   }
# }
