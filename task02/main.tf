terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.91.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg-alzver-proj" {
  name     = "rg-${var.postfix}"
  location = var.location
}

resource "azurerm_virtual_network" "vnc-alzver-proj" {
  name                = "vnc-${var.postfix}"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg-alzver-proj.name
}

resource "azurerm_subnet" "subnet-int" {
  name                 = "subnet-int"
  resource_group_name  = azurerm_resource_group.rg-alzver-proj.name
  virtual_network_name = azurerm_virtual_network.vnc-alzver-proj.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "nic-alzver-proj" {
  name                = "nic-${var.postfix}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg-alzver-proj.name

  ip_configuration {
    name                          = "ipconfig01"
    subnet_id                     = azurerm_subnet.subnet-int.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pubip-alzver-proj.id
  }
}

resource "azurerm_public_ip" "pubip-alzver-proj" {
  name                = "pubip-alzver-proj"
  resource_group_name = azurerm_resource_group.rg-alzver-proj.name
  location            = var.location
  allocation_method   = "Dynamic"
}
