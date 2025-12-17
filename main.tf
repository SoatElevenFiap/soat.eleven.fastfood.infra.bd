# Create a resource group
resource "azurerm_resource_group" "rg-postech-database" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

# PostgreSQL Database Module
module "database" {
  source = "./modules/database"
  # Configuração obrigatória
  server_name         = var.postgresql_server_name
  location            = var.postgres_location
  resource_group_name = azurerm_resource_group.rg-postech-database.name

  # Configuração econômica
  postgresql_version    = var.postgresql_version
  sku_name              = var.postgresql_sku_name
  storage_mb            = var.postgresql_storage_mb
  backup_retention_days = var.postgresql_backup_retention_days

  # Banco de dados
  database_name = var.postgresql_database_name

  # Tags
  tags = merge(var.tags, {
    Environment = var.environment
    Project     = "FastFood-System"
    CreatedBy   = "Terraform"
    Module      = "PostgreSQL"
  })
}

module "database-user-service" {
  source = "./modules/database"
  # Configuração obrigatória
  server_name         = var.postgresql_server_name_user_service
  location            = var.postgres_location
  resource_group_name = azurerm_resource_group.rg-postech-database.name

  # Configuração econômica
  postgresql_version    = var.postgresql_version
  sku_name              = var.postgresql_sku_name
  storage_mb            = var.postgresql_storage_mb
  backup_retention_days = var.postgresql_backup_retention_days

  # Banco de dados
  database_name = var.postgresql_database_name

  # Tags
  tags = merge(var.tags, {
    Environment = var.environment
    Project     = "FastFood-System"
    CreatedBy   = "Terraform"
    Module      = "PostgreSQL"
  })
}

module "keyvault" {
  source = "./modules/keyvault"

  keyvault_name       = var.keyvault_name
  resource_group_name = azurerm_resource_group.rg-postech-database.name
  location            = azurerm_resource_group.rg-postech-database.location

  sku_name = var.keyvault_sku_name

  database_connection_string = module.database.connection_string

  # Application Security Keys
  salt_key   = var.app_salt_key
  secret_key = var.app_secret_key

  tags = merge(var.tags, {
    Environment = var.environment
    Project     = "FastFood-System"
    CreatedBy   = "Terraform"
    Module      = "KeyVault"
  })

  depends_on = [azurerm_resource_group.rg-postech-database]
}
