# =================
# Configuração Principal - SOAT Eleven Fast Food
# Infraestrutura Simplificada - Apenas PostgreSQL
# =================

# Configurações do Resource Group Existente
resource_group_name = "rg-fastfood-postech-database"
location            = "Canada Central" # Região primária para recursos

# Configurações da VNet Existente  
vnet_name = "vnet-fastfood-postech"

# Environment
environment = "dev"

# Tags para identificação de recursos
tags = {
  Environment = "Development"
  Project     = "SOAT-FastFood"
  Course      = "PosGraduacao-ArquiteturaSoftware"
  Purpose     = "Learning"
}

# =================
# Configuração PostgreSQL - Configuração Econômica
# =================
postgresql_server_name              = "psql-fastfood-postech-001-lowcost-and"
postgresql_server_name_user_service = "psql-fastfood-postech-user-service"

postgresql_version                  = "14"
postgresql_sku_name                 = "B_Standard_B1ms" # SKU mais econômico
postgresql_storage_mb               = 32768             # 32GB - mínimo
postgresql_backup_retention_days    = 7                 # Mínimo para economia
postgresql_database_name            = "fastfood"
postgres_location                   = "Canada Central"  # Região disponivel no Azure configurado no Action
postgres_low_cost_location          = "West Central US" # Região com custo mais baixo

# =================
# Configuração Key Vault
# =================
keyvault_name     = "kv-fastfood-pt-26dec"
keyvault_sku_name = "standard"