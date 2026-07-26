output "app_vm_ids" {
  description = "IDs of the Application Virtual Machines"
  value       = { for k, v in azurerm_linux_virtual_machine.app_vm : k => v.id }
}

output "app_vm_private_ips" {
  description = "Private IP addresses of Application Virtual Machines"
  value       = { for k, v in azurerm_linux_virtual_machine.app_vm : k => v.private_ip_address }
}
