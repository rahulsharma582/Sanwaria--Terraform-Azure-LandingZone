output "db_vm_ids" {
  description = "IDs of the Database Virtual Machines"
  value       = { for k, v in azurerm_linux_virtual_machine.db_vm : k => v.id }
}

output "db_vm_private_ips" {
  description = "Private IP addresses of Database Virtual Machines"
  value       = { for k, v in azurerm_linux_virtual_machine.db_vm : k => v.private_ip_address }
}
