output "appgw_ids" {
  description = "IDs of Application Gateways"
  value       = { for k, v in azurerm_application_gateway.appgw : k => v.id }
}
