resource "azurerm_storage_account" "strprivate" {
  name                = "${var.default_name}strpvt"
  location            = azurerm_resource_group.resource.location
  resource_group_name = azurerm_resource_group.resource.name
  tags                = var.tags

  account_tier             = "Standard"
  account_replication_type = "GRS"
  account_kind             = "StorageV2"

  network_rules {
    default_action             = "Deny"
    virtual_network_subnet_ids = [azurerm_subnet.subnet.id]
  }
}

resource "azurerm_storage_account" "strpublic" {
  name                = "${var.default_name}strpub"
  location            = azurerm_resource_group.resource.location
  resource_group_name = azurerm_resource_group.resource.name
  tags                = var.tags

  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_cdn_profile" "cdn" {
  name                = "${var.default_name}cdn"
  location            = azurerm_resource_group.resource.location
  resource_group_name = azurerm_resource_group.resource.name
  tags                = var.tags

  sku = "Standard_Microsoft"
}
