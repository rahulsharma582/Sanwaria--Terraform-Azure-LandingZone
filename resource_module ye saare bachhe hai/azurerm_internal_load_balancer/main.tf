resource "azurerm_lb" "ilb" {
  for_each            = var.ilb
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = lookup(each.value, "sku", "Standard")

  frontend_ip_configuration {
    name                          = "${each.value.name}-frontend-ip"
    subnet_id                     = data.azurerm_subnet.ilb_snet[each.key].id
    private_ip_address_allocation = lookup(each.value, "private_ip_allocation", "Dynamic")
    private_ip_address            = lookup(each.value, "private_ip_address", null)
  }

  tags = lookup(each.value, "tags", {
    Environment = "prod"
    Tier        = "InternalLB"
  })
}

resource "azurerm_lb_backend_address_pool" "ilb_backend_pool" {
  for_each        = var.ilb
  loadbalancer_id = azurerm_lb.ilb[each.key].id
  name            = "${each.value.name}-backend-pool"
}

resource "azurerm_lb_probe" "ilb_probe" {
  for_each        = var.ilb
  loadbalancer_id = azurerm_lb.ilb[each.key].id
  name            = "${each.value.name}-health-probe"
  port            = lookup(each.value, "probe_port", 80)
  protocol        = lookup(each.value, "probe_protocol", "Http")
  request_path    = lookup(each.value, "probe_protocol", "Http") == "Http" || lookup(each.value, "probe_protocol", "Http") == "Https" ? lookup(each.value, "probe_path", "/") : null
}

resource "azurerm_lb_rule" "ilb_rule" {
  for_each                       = var.ilb
  loadbalancer_id                = azurerm_lb.ilb[each.key].id
  name                           = "${each.value.name}-lb-rule"
  protocol                       = lookup(each.value, "rule_protocol", "Tcp")
  frontend_port                  = lookup(each.value, "frontend_port", 80)
  backend_port                   = lookup(each.value, "backend_port", 80)
  frontend_ip_configuration_name = "${each.value.name}-frontend-ip"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.ilb_backend_pool[each.key].id]
  probe_id                       = azurerm_lb_probe.ilb_probe[each.key].id
}

resource "azurerm_network_interface_backend_address_pool_association" "ilb_nic_assoc" {
  for_each                = { for k, v in var.ilb : k => v if lookup(v, "backend_nic_name", null) != null }
  network_interface_id    = data.azurerm_network_interface.backend_nic[each.key].id
  ip_configuration_name   = lookup(each.value, "backend_ip_config_name", "Internal")
  backend_address_pool_id = azurerm_lb_backend_address_pool.ilb_backend_pool[each.key].id
}
