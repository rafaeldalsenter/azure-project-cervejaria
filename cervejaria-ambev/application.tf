
resource "azurerm_container_registry" "acr" {
  name                = "${var.default_name}acr"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  tags                = var.tags

  sku           = "Basic"
  admin_enabled = false
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.default_name}aks"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  tags                = var.tags

  dns_prefix = "example"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  addon_profile {
    kube_dashboard {
      enabled = true
    }
  }
}
