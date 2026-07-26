data "azurerm_subnet" "appgw_snet" {
  for_each             = var.appgw
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "appgw_pip" {
  for_each            = var.appgw
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}
