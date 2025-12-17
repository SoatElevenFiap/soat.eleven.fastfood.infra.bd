# Key Vault outputs essenciais
output "keyvault_id" {
  description = "ID do Azure Key Vault"
  value       = azurerm_key_vault.main.id
}

output "keyvault_name" {
  description = "Nome do Azure Key Vault"
  value       = azurerm_key_vault.main.name
}

output "keyvault_uri" {
  description = "URI do Azure Key Vault"
  value       = azurerm_key_vault.main.vault_uri
}

output "tenant_id" {
  description = "Tenant ID do Azure"
  value       = azurerm_key_vault.main.tenant_id
}

output "resource_group_name" {
  description = "Nome do Resource Group"
  value       = azurerm_key_vault.main.resource_group_name
}

output "location" {
  description = "Localização do Key Vault"
  value       = azurerm_key_vault.main.location
}

# Database Connection String Secret outputs
output "database_secret_uri" {
  description = "ID do secret da connection string do banco"
  value       = azurerm_key_vault_secret.database_connection[0].id
}

# Salt Key Secret outputs
output "salt_key_secret_uri" {
  description = "ID do secret salt key"
  value       = azurerm_key_vault_secret.salt_key[0].id
}

# Secret Key outputs
output "secret_key_secret_uri" {
  description = "ID do secret key para tokens"
  value       = azurerm_key_vault_secret.secret_key[0].id
}

# Access information
output "keyvault_access_policy_object_id" {
  description = "Object ID usado na access policy"
  value       = data.azurerm_client_config.current.object_id
}