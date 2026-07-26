# Azure Database VM Module

This module provisions Database Virtual Machines in Azure with private IP address configurations, managed OS disks, optional data disk attachments, and boot diagnostics using data source lookups for Network Interfaces.

## Requirements
- Terraform >= 1.6
- AzureRM provider >= 3.0

## Usage
```hcl
module "azurerm_database_vm" {
  source = "../../resource_module ye saare bachhe hai/azurerm_database_vm"
  db_vm  = var.db_vm
}
```
