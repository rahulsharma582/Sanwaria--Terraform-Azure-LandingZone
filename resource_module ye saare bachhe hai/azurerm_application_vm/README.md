# Azure Application VM Module

This module provisions Application Virtual Machines in Azure using the `for_each` pattern and data source lookups for Network Interfaces.

## Requirements
- Terraform >= 1.6
- AzureRM provider >= 3.0

## Usage
```hcl
module "azurerm_application_vm" {
  source = "../../resource_module ye saare bachhe hai/azurerm_application_vm"
  app_vm = var.app_vm
}
```
