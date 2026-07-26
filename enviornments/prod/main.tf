module "azurerm_resource_group" {
  source = "../../resource_module ye saare bachhe hai/azurerm_resource_group"
  rgs    = var.rgs
}

module "azurerm_virtual_network" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../resource_module ye saare bachhe hai/azurerm_virtual_network"
  vnet       = var.vnet
}


