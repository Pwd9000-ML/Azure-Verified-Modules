
# Locals block to define the subnet names carve /24 address space into 4 subnets of equal size. (subnets: common, data, compute and web)
locals {
  subnet_names = ["common", "data", "compute", "web"]
  subnets = {
    for each in local.subnet_names : "subnet${each}" => {
      address_prefixes = [cidrsubnet(local.virtual_network_address_space, 2, each)]
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