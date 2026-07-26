data "azurerm_subnet" "ilb_snet" {
  for_each             = var.ilb
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_network_interface" "backend_nic" {
  for_each            = { for k, v in var.ilb : k => v if lookup(v, "backend_nic_name", null) != null }
  name                = each.value.backend_nic_name
  resource_group_name = each.value.resource_group_name
}
