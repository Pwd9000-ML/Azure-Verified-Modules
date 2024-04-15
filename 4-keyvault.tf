# Commonalities accross Azure verified modules are things such as (These can be created as part of the module and assigned to the resource):
# - managed identities 
# - private endpoints
# - role assignments
# Defaults if not specified will always be set as per MS recommended best and secure practices, see the module documentation for more details: https://registry.terraform.io/modules/Azure/avm-res-storage-storageaccount/azurerm/latest

module "keyvault" {
  source  = "Azure/avm-res-keyvault-vault/azurerm"
  version = "0.5.3"

  name                          = "avm-demo-kv-${random_integer.number.result}"
  enable_telemetry              = true
  location                      = "uksouth"
  resource_group_name           = azurerm_resource_group.rg.name
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  public_network_access_enabled = false

  # private endpoints (optional)
  private_endpoints = {
    kv = {
      name                          = "avm-demo-kv-pe-${random_integer.number.result}"
      subnet_resource_id            = module.vnet.subnets["common"].id
      private_dns_zone_resource_ids = [azurerm_private_dns_zone.privatelink["privatelink.vault.azure.net"].id]

      # these are optional but illustrate making well-aligned service connection & NIC names.
      private_service_connection_name = "avm-demo-kv-pe-sc-${random_integer.number.result}"
      network_interface_name          = "avm-demo-kv-pe-nic-${random_integer.number.result}"

      role_assignments = {
        role_assignment_pe = {
          role_definition_id_or_name = "Contributor"
          principal_id               = data.azurerm_client_config.current.object_id
        }
      }
    }
  }

  # role assignments (optional)
  role_assignments = {
    role_assignment_kv = {
      role_definition_id_or_name       = "key vault secrets officer"
      principal_id                     = data.azurerm_client_config.current.object_id
      skip_service_principal_aad_check = false
    },
  }
}
