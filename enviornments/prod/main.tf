module "azurerm_resource_group" {
  source = "../../resource_module ye saare bachhe hai/azurerm_resource_group"
  rgs    = var.rgs
}

module "azurerm_virtual_network" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../resource_module ye saare bachhe hai/azurerm_virtual_network"
  vnet       = var.vnet
}

module "azurerm_subnet" {
  depends_on = [module.azurerm_virtual_network]
  source     = "../../resource_module ye saare bachhe hai/azurerm_subnet"
  snet       = var.snet
}

module "azurerm_public_ip" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../resource_module ye saare bachhe hai/azurerm_public_ip"
  pip        = var.pip
}

module "azurerm_network_interface" {
  depends_on = [module.azurerm_resource_group, module.azurerm_subnet, module.azurerm_public_ip]
  source     = "../../resource_module ye saare bachhe hai/azurerm_network_interface"
  nic        = var.nic
}

module "azurerm_virtual_machine" {
  depends_on = [module.azurerm_resource_group, module.azurerm_subnet, module.azurerm_public_ip, module.azurerm_network_interface]
  source     = "../../resource_module ye saare bachhe hai/azurerm_virtual_machine"
  vm         = var.vm
}

module "azurerm_application_vm" {
  depends_on = [module.azurerm_resource_group, module.azurerm_subnet, module.azurerm_network_interface]
  source     = "../../resource_module ye saare bachhe hai/azurerm_application_vm"
  app_vm     = var.app_vm
}

module "azurerm_database_vm" {
  depends_on = [module.azurerm_resource_group, module.azurerm_subnet, module.azurerm_network_interface]
  source     = "../../resource_module ye saare bachhe hai/azurerm_database_vm"
  db_vm      = var.db_vm
}

module "azurerm_internal_load_balancer" {
  depends_on = [module.azurerm_resource_group, module.azurerm_subnet, module.azurerm_network_interface]
  source     = "../../resource_module ye saare bachhe hai/azurerm_internal_load_balancer"
  ilb        = var.ilb
}

module "azurerm_application_gateway" {
  depends_on = [module.azurerm_resource_group, module.azurerm_subnet, module.azurerm_public_ip]
  source     = "../../resource_module ye saare bachhe hai/azurerm_application_gateway"
  appgw      = var.appgw
}
