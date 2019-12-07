terraform {
  backend "azurerm" {
    resource_group_name  = "Terraform-RG"
    storage_account_name = "terraformstorageaccount1"
    container_name       = "terraform-state-test1"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=1.36.0"
}


resource "azurerm_resource_group" "RG" {
  name     = "jenkins"
  location = "West Europe"
}


resource "azurerm_virtual_network" "vnet" {
  name                = "darek-net"
  location            = "West Europe"
  resource_group_name = azurerm_resource_group.RG.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "vnet_subnet" {
  name                      = "sub1"
  resource_group_name       = azurerm_resource_group.RG.name
  virtual_network_name      = azurerm_virtual_network.vnet.name
  address_prefix            = "10.0.1.0/24"
}