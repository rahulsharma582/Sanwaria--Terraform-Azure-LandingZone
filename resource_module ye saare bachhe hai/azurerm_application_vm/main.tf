resource "azurerm_linux_virtual_machine" "app_vm" {
  for_each                        = var.app_vm
  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = lookup(each.value, "size", "Standard_B1s")
  admin_username                  = lookup(each.value, "admin_username", "Devopsadmin")
  admin_password                  = lookup(each.value, "admin_password", "Admin@123")
  disable_password_authentication = false
  network_interface_ids           = [data.azurerm_network_interface.app_nic[each.key].id]

  os_disk {
    caching              = lookup(each.value, "caching", "ReadWrite")
    storage_account_type = lookup(each.value, "storage_account_type", "Standard_LRS")
  }

  source_image_reference {
    publisher = lookup(each.value, "publisher", "Canonical")
    offer     = lookup(each.value, "offer", "0001-com-ubuntu-server-jammy")
    sku       = lookup(each.value, "sku", "22_04-lts")
    version   = lookup(each.value, "version", "latest")
  }

  boot_diagnostics {
    storage_account_uri = lookup(each.value, "boot_diagnostics_storage_uri", null)
  }

  tags = lookup(each.value, "tags", {
    Environment = "prod"
    Tier        = "Application"
  })
}
