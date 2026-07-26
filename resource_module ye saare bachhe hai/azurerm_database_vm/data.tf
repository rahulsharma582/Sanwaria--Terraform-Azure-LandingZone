data "azurerm_network_interface" "db_nic" {
  for_each            = var.db_vm
  name                = each.value.network_interface_name
  resource_group_name = each.value.resource_group_name
}
