terraform {
  backend "azurerm" {}
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

#################################################
# PRE-REQS                                      #
#################################################
### Random integer to generate unique names
resource "random_integer" "number" {
  min = 0001
  max = 9999
}

### Resource group to deploy the Key Vault into
resource "azurerm_resource_group" "rg" {
  name     = "global-azure-avm-demo-${random_integer.number.result}"
  location = "uksouth"
}