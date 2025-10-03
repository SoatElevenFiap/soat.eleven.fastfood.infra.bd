# Azure Database for PostgreSQL Flexible Server - Configuração Econômica
resource "azurerm_postgresql_flexible_server" "main" {
  name                   = var.server_name
  resource_group_name    = var.resource_group_name
  location              = var.location
  version               = var.postgresql_version
  administrator_login    = "adm"
  administrator_password = "adm123"
  
  # Storage configuration (mínimo)
  storage_mb = var.storage_mb
  
  # SKU configuration (econômico)
  sku_name = var.sku_name
  
  # Backup configuration (mínimo)
  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = false  # Desabilitado para economia

  # Configurações explícitas para evitar o erro de rede
  public_network_access_enabled = true
  
  # Adicione um timeout customizado
  timeouts {
    create = "30m"
    update = "30m"
    delete = "30m"
  }
  
  tags = var.tags
}

# PostgreSQL Database
resource "azurerm_postgresql_flexible_server_database" "main" {
  name      = var.database_name
  server_id = azurerm_postgresql_flexible_server.main.id
  collation = "en_US.utf8"
  charset   = "UTF8"

  depends_on = [azurerm_postgresql_flexible_server.main]
  
  timeouts {
    create = "10m"
    delete = "10m"
  }
}
}

# Firewall rule to allow public access from any Azure service within Azure
resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_azure_services" {
  name             = "AllowAllAzureIps"
  server_id        = azurerm_postgresql_flexible_server.main.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}