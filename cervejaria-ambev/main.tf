provider "azurerm" {
  version = "~>2.0"
  environment = "public"
  features {}
}

resource "azurerm_resource_group" "default" {
  name     = "example-terraform"
  location = "eastus"
  tags = var.tags
}

resource "azurerm_kubernetes_cluster" "example" {
  name = "exampleaks"
  location = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  tags = var.tags

  dns_prefix = "example"

  default_node_pool {
    name = "default"
    node_count = 1
    vm_size = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}