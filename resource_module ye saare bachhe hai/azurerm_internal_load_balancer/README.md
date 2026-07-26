# Azure Internal Load Balancer Module

This module provisions Azure Internal Load Balancers with Standard SKU, private frontend IP configurations, health probes, rules, and backend pool NIC associations.

## Requirements
- Terraform >= 1.6
- AzureRM provider >= 3.0

## Usage
```hcl
module "azurerm_internal_load_balancer" {
  source = "../../resource_module ye saare bachhe hai/azurerm_internal_load_balancer"
  ilb    = var.ilb
}
```
