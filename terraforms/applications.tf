
resource "azurerm_container_registry" "acr" {
  name                = "${var.default_name}acr"
  location            = azurerm_resource_group.resource.location
  resource_group_name = azurerm_resource_group.resource.name
  tags                = var.tags

  sku           = "Basic"
  admin_enabled = false

  network_rule_set {
    default_action = "Deny"
    virtual_network = [{
      action    = "Allow"
      subnet_id = azurerm_subnet.subnet.id
    }]
  }
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.default_name}aks"
  location            = azurerm_resource_group.resource.location
  resource_group_name = azurerm_resource_group.resource.name
  tags                = var.tags

  dns_prefix = var.default_name

  default_node_pool {
    name           = "default"
    node_count     = 1
    vm_size        = "Standard_DS2_v2"
    vnet_subnet_id = azurerm_subnet.subnet.id
  }
}
