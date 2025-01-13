# Commonalities accross Azure verified modules (interfaces):
# - Diagnostic Settings
# - Role Assignments
# - Resource Locks
# - Tags
# - Managed Identities
# - Private Endpoints
# - Customer Managed Keys
# - Azure Monitor Alerts
# Defaults if not specified will always be set as per MS recommended best and secure practices, see the module documentation for more details: https://registry.terraform.io/modules/Azure/avm-res-storage-storageaccount/azurerm/latest

module "container_registry" {
  source  = "Azure/avm-res-containerregistry-registry/azurerm"
  version = "0.4.0"

  name                          = "avmdemoacr${random_integer.number.result}"
  enable_telemetry              = true
  location                      = "uksouth"
  sku                           = "Premium"
  resource_group_name           = azurerm_resource_group.rg.name
  public_network_access_enabled = true

  # private endpoints (optional)
  private_endpoints = {
    acr = {
      name                          = "avm-demo-acr-pe-${random_integer.number.result}"
      subnet_resource_id            = module.vnet.subnets["data"].id
      private_dns_zone_resource_ids = [azurerm_private_dns_zone.privatelink["privatelink.azurecr.io"].id]

      # these are optional but illustrate making well-aligned service connection & NIC names.
      private_service_connection_name = "avm-demo-acr-pe-sc-${random_integer.number.result}"
      network_interface_name          = "avm-demo-acr-pe-nic-${random_integer.number.result}"

      role_assignments = {
        role_assignment_pe = {
          role_definition_id_or_name = "contributor"
          principal_id               = data.azurerm_client_config.current.object_id
        }
      }
    }
  }

  # role assignments (optional)
  role_assignments = {
    role_assignment_kv = {
      role_definition_id_or_name       = "acrpull"
      principal_id                     = data.azurerm_client_config.current.object_id
      skip_service_principal_aad_check = false
    },
  }
}
