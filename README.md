# Azure-Verified-Modules

Microsoft Azure Verified Modules (AVM) are a curated set of infrastructure-as-code (IaC) modules that are compliant with the Azure Well-Architected Framework and have been tested and verified by Microsoft. These modules are designed to help you build secure, scalable, and resilient cloud environments on Azure.  

This repository contains the source code for the Azure Verified Modules (AVM) that are available in the Terraform Registry as part of a demo @ [Global Azure 2024](https://globalazure.net/)  

Microsoft London Reactor Meetup Link: [Global Azure 2024](https://www.meetup.com/microsoft-reactor-london/events/300367821/)  
Blog Post (COMING SOON): [Azure Verified Modules (AVM)](xxxxxx)  
Slides (COMING SOON): [Azure Verified Modules (AVM)](xxxxxx)  

![image](./assets/GlobalAzure2024-500.png)  

## More details on Azure Verified Modules (AVM)

More details on [Azure Verified Modules (AVM)](https://azure.github.io/Azure-Verified-Modules?wt.mc_id=DT-MVP-5004771)  

## Useful Labs to Learn

- [AVM - Terraform Lab](https://learn.microsoft.com/en-us/samples/azure-samples/avm-terraform-labs/avm-terraform-labs?wt.mc_id=DT-MVP-5004771)  
- [AVM - Bicep Lab](https://learn.microsoft.com/en-us/samples/azure-samples/avm-bicep-labs/avm-bicep-labs?wt.mc_id=DT-MVP-5004771)  

## Demo Template Usage

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_keyvault"></a> [keyvault](#module\_keyvault) | Azure/avm-res-keyvault-vault/azurerm | 0.5.3 |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | Azure/avm-res-storage-storageaccount/azurerm | 0.1.1 |
| <a name="module_vnet"></a> [vnet](#module\_vnet) | Azure/avm-res-network-virtualnetwork/azurerm | 0.1.4 |

## Resources

| Name | Type |
|------|------|
| [azurerm_private_dns_zone.privatelink](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [random_integer.number](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->