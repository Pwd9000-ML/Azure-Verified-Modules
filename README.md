# Azure-Verified-Modules

Microsoft Azure Verified Modules (AVM) are a curated set of infrastructure-as-code (IaC) modules that are compliant with the Azure Well-Architected Framework and is actively maintained, tested and verified by Microsoft. These modules are designed to help you build secure, scalable, and resilient cloud environments on Azure.  

This repository contains the source code for the Azure Verified Modules (AVM) that are available in the Terraform Registry as part of a demo at this years **[Global Azure 2024](https://globalazure.net/)** event. It's main purpose is to demonstrate the usage of Azure Verified Modules (AVM) in a Terraform configuration where configuration options are uniform and consistent across multiple modules, in terms of best practices and security.  

Implantation of uniform and consistent configuration options across multiple modules is a key feature of Azure Verified Modules (AVM). This is achieved by having the same configuration options across all modules in the same pattern and features, which makes it easier to use and understand the modules and attain a consistent configuration across all modules. For example **private endpoints**, **diagnostics settings**, **identity**, **role-based access control (RBAC)**, and more.  

Microsoft London Reactor Meetup Link: [Global Azure 2024](https://www.meetup.com/microsoft-reactor-london/events/300367821/)  
Blog Post: [(COMING SOON)](xxxxxx)  
Slides: [Azure Verified Modules (AVM) - Global Azure 2024 Slides](https://github.com/Pwd9000-ML/Azure-Verified-Modules/tree/master/assets)  

![image](./assets/GlobalAzure2024-500.png)  

## More details on Azure Verified Modules (AVM)

More details on [Azure Verified Modules (AVM)](https://azure.github.io/Azure-Verified-Modules?wt.mc_id=DT-MVP-5004771)  

## Useful Labs to Learn

For more details on how to use Terraform and Bicep with Azure, you can check the following labs:  

- [AVM - Terraform Lab](https://learn.microsoft.com/en-us/samples/azure-samples/avm-terraform-labs/avm-terraform-labs?wt.mc_id=DT-MVP-5004771)  
- [AVM - Bicep Lab](https://learn.microsoft.com/en-us/samples/azure-samples/avm-bicep-labs/avm-bicep-labs?wt.mc_id=DT-MVP-5004771)  

## This Template Usage

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
| <a name="module_container_registry"></a> [container\_registry](#module\_container\_registry) | Azure/avm-res-containerregistry-registry/azurerm | 0.1.0 |
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