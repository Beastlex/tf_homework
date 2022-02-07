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
  # name = ""
  # resource_group_name
}

data "azurerm_subnet" "subnet" {
  # name = ""
  # virtual_network_name = ""
}

data "azurerm_network_security_group" "nsg" {
  # name = ""
  # resource_group_name = "same in vnc"
}
