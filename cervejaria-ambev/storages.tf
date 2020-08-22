resource "azurerm_storage_account" "str_ambev" {
  name                = "cervejariaambev"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  tags                = var.tags

  account_tier             = "Standard"
  account_replication_type = "GRS"
  account_kind             = "StorageV2"
}

resource "azurerm_cdn_profile" "cdn_ambev" {
  name                = "cervejariaambev"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  tags                = var.tags

  sku = "Standard_Microsoft"
}
