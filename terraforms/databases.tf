
resource "azurerm_mysql_server" "mysql" {
  name                = "${var.default_name}mysql"
  location            = azurerm_resource_group.resource.location
  resource_group_name = azurerm_resource_group.resource.name
  tags                = var.tags

  administrator_login          = var.mysql_user
  administrator_login_password = var.mysql_password
  version                      = "5.7"
  sku_name                     = "GP_Gen5_4"
  storage_mb                   = 102400

  auto_grow_enabled             = false
  backup_retention_days         = 7
  geo_redundant_backup_enabled  = false
  public_network_access_enabled = false
  ssl_enforcement_enabled       = true
}

resource "azurerm_mysql_virtual_network_rule" "mysqlrule" {
  name                = "${var.default_name}mysqlrule"
  resource_group_name = azurerm_resource_group.resource.name
  server_name         = azurerm_mysql_server.mysql.name
  subnet_id           = azurerm_subnet.subnet.id
}

resource "azurerm_redis_cache" "redis" {
  name                = "${var.default_name}redis"
  location            = azurerm_resource_group.resource.location
  resource_group_name = azurerm_resource_group.resource.name
  tags                = var.tags

  capacity            = 1
  family              = "C"
  sku_name            = "Standard"
  enable_non_ssl_port = false
  minimum_tls_version = "1.2"
}
