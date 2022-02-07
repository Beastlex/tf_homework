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

data "azurerm_virtual_network" "vnc" {
  name                = var.vnc_name
  resource_group_name = var.rg_name
}

data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnc_name
}

data "azurerm_network_security_group" "nsg" {
  name                = var.sg_name
  resource_group_name = var.rg_name
}
