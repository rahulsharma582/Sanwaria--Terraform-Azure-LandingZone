# Azure Application Gateway Module

This module provisions Azure Application Gateway (v2) with public frontend IP, HTTP listener, backend pool, health probes, and request routing rules using data source lookups.

## Requirements
- Terraform >= 1.6
- AzureRM provider >= 3.0

## Usage
```hcl
module "azurerm_application_gateway" {
  source = "../../resource_module ye saare bachhe hai/azurerm_application_gateway"
  appgw  = var.appgw
}
```
