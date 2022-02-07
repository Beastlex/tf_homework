resource "azurerm_virtual_machine" "vm-alzver-proj" {
  name = "vm-${var.postfix}"
  location = var.location
  resource_group_name = azurerm_resource_group.rg-alzver-proj.name
  network_interface_ids = [azurerm_network_interface.nic-alzver-proj.id]
  vm_size = "Standard_DS1_v2"

  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer = "UbuntuServer"
    sku = "18.04-LTS"
    version = "latest"
  }

  storage_os_disk {
    name = "osdisk"
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name = "ubuntu-server"
    admin_username = "srv-admin"
    admin_password = "!SoStr0ngPassword"
    user_data = file("azure-user-data.sh")
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    owner = var.owner
  }
}
