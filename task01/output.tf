output "vnc_name" {
  value     = azurerm_virtual_network.vnc.name
  description = "vnc named {$var.vnc_name} in resource group ${var.rg_name}"
}

output "subnet" {
  value = azurerm_subnet.subnet.name
  description = "subnet in that VNC"
}

output "nsg" {
  value = azurerm_network_security_group.nsg.name
  description = "Network security group in resource group ${var.rg_name}"
}
