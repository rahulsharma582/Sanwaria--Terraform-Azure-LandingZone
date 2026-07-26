resource "azurerm_network_interface" "nic" {
  for_each            = var.nic
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  ip_configuration {
    name                          = each.value.ip_configuration_name
    subnet_id                     = data.azurerm_subnet.s-net[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
  }
}
