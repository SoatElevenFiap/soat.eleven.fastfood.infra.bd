# Data source para obter informações do tenant atual
data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "main" {
  name                = var.keyvault_name
  resource_group_name = var.resource_group_name
  location           = var.location
  tenant_id          = data.azurerm_client_config.current.tenant_id
  sku_name           = var.sku_name

  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  
  public_network_access_enabled = var.public_network_access_enabled
  
  soft_delete_retention_days = var.soft_delete_retention_days
  purge_protection_enabled   = var.purge_protection_enabled

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = var.current_user_key_permissions
    secret_permissions = var.current_user_secret_permissions
    certificate_permissions = var.current_user_certificate_permissions
  }

  tags = var.tags
}

# Database Connection String Secret
resource "azurerm_key_vault_secret" "database_connection" {
  count        = var.database_connection_string != null ? 1 : 0
  name         = "database-connection-string"
  value        = var.database_connection_string
  key_vault_id = azurerm_key_vault.main.id
  content_type = "Database Connection String"
  
  tags = merge(var.tags, {
    Purpose = "Database Connection"
    Type    = "Connection String"
  })
  
  depends_on = [azurerm_key_vault.main]
}

# Salt Key Secret for Password Encryption
resource "azurerm_key_vault_secret" "salt_key" {
  count        = var.salt_key != null ? 1 : 0
  name         = "app-salt-key"
  value        = var.salt_key
  key_vault_id = azurerm_key_vault.main.id
  content_type = "Application Salt Key"
  
  tags = merge(var.tags, {
    Purpose = "Password Encryption"
    Type    = "Salt Key"
  })
  
  depends_on = [azurerm_key_vault.main]
}

# Secret Key for Token Encryption
resource "azurerm_key_vault_secret" "secret_key" {
  count        = var.secret_key != null ? 1 : 0
  name         = "app-secret-key"
  value        = var.secret_key
  key_vault_id = azurerm_key_vault.main.id
  content_type = "Application Secret Key"
  
  tags = merge(var.tags, {
    Purpose = "Token Encryption"
    Type    = "Secret Key"
  })
  
  depends_on = [azurerm_key_vault.main]
}