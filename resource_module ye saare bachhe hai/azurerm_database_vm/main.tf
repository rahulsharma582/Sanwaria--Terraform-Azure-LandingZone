resource "azurerm_linux_virtual_machine" "db_vm" {
  for_each                        = var.db_vm
  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = lookup(each.value, "size", "Standard_B2s")
  admin_username                  = lookup(each.value, "admin_username", "Devopsadmin")
  admin_password                  = lookup(each.value, "admin_password", "Admin@123")
  disable_password_authentication = false
  network_interface_ids           = [data.azurerm_network_interface.db_nic[each.key].id]

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
    Tier        = "Database"
  })
}

resource "azurerm_managed_disk" "db_data_disk" {
  for_each             = { for k, v in var.db_vm : k => v if lookup(v, "create_data_disk", false) }
  name                 = "${each.value.name}-data-disk"
  location             = each.value.location
  resource_group_name  = each.value.resource_group_name
  storage_account_type = lookup(each.value, "data_disk_type", "Standard_LRS")
  create_option        = "Empty"
  disk_size_gb         = lookup(each.value, "data_disk_size_gb", 10)

  tags = lookup(each.value, "tags", {
    Environment = "prod"
    Tier        = "Database"
  })
}

resource "azurerm_virtual_machine_data_disk_attachment" "db_data_disk_attach" {
  for_each           = { for k, v in var.db_vm : k => v if lookup(v, "create_data_disk", false) }
  managed_disk_id    = azurerm_managed_disk.db_data_disk[each.key].id
  virtual_machine_id = azurerm_linux_virtual_machine.db_vm[each.key].id
  lun                = lookup(each.value, "data_disk_lun", 10)
  caching            = lookup(each.value, "data_disk_caching", "ReadWrite")
}
