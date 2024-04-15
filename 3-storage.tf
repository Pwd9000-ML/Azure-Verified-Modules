# Commonalities accross Azure verified modules are things such as (These can be created as part of the module and assigned to the resource):
# - managed identities 
# - customer managed keys 
# - private endpoints
# - role assignments
# Defaults if not specified will always be set as per MS recommended best and secure practices, see the module documentation for more details: https://registry.terraform.io/modules/Azure/avm-res-storage-storageaccount/azurerm/latest

module "storage_account" {
  source  = "Azure/avm-res-storage-storageaccount/azurerm"
  version = "0.1.1"

  name                              = "avmdemosa${random_integer.number.result}"
  enable_telemetry                  = true
  resource_group_name               = azurerm_resource_group.rg.name
  account_replication_type          = "ZRS"
  access_tier                       = "Hot"
  account_kind                      = "BlobStorage"
  account_tier                      = "Standard"
  location                          = "uksouth"
  infrastructure_encryption_enabled = true

  # Container (optional)
  containers = {
    blob_container_0 = {
      name                  = "blob-container-0"
      container_access_type = "private"
    }
    blob_container_1 = {
      name                  = "blob-container-1"
      container_access_type = "private"
    }
  }

  # managed identities (optional)
  managed_identities = {
    system_assigned = true
    #user_assigned_resource_ids = [azurerm_user_assigned_identity.example_identity.id]
  }

  # private endpoints (optional)
  private_endpoints = {
    name                          = "avm-demo-blob-pe-${random_integer.number.result}"
    subnet_resource_id            = module.vnet.subnets["common"].id
    subresource_name              = ["blob"]
    private_dns_zone_resource_ids = [module.private_dns_zones["privatelink.blob.core.windows.net"]]

    # these are optional but illustrate making well-aligned service connection & NIC names.
    private_service_connection_name = "avm-demo-blob-pe-sc-${random_integer.number.result}"
  }

  # role assignments (optional)
  role_assignments = {
    role_assignment_1 = {
      role_definition_id_or_name       = "Storage Blob Data Reader"
      principal_id                     = data.azurerm_client_config.current.object_id
      skip_service_principal_aad_check = false
    },
  }
}
