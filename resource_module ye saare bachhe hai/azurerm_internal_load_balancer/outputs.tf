output "ilb_ids" {
  description = "IDs of the Internal Load Balancers"
  value       = { for k, v in azurerm_lb.ilb : k => v.id }
}

output "ilb_private_ip_addresses" {
  description = "Private IP addresses of Internal Load Balancer frontend configurations"
  value       = { for k, v in azurerm_lb.ilb : k => v.frontend_ip_configuration[0].private_ip_address }
}
