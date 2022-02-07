output "vnc_name" {
  value     = data.azurerm_virtual_network.vnc.name
  description = "Virtual Network"
}

output "subnet" {
  value = data.azurerm_subnet.subnet.name
  description = "Subnet in that VNC"
}

output "nsg" {
  value = data.azurerm_network_security_group.nsg.name
  description = "Network security group in resource group"
}
