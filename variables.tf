# =================
# General Variables
# =================
variable "location" {
  description = "Localização dos recursos no Azure"
  type        = string
  default     = "Canada Central"

  validation {
    condition = contains([
      "West US 3",
      "West US 2",
      "East US",
      "Central US",
      "South Central US",
      "North Central US",
      "Brazil South",
      "West Europe",
      "North Europe",
      "Canada Central"
    ], var.location)
    error_message = "A localização deve ser uma região válida do Azure."
  }
}
variable "resource_group_name" {
  description = "Nome do Resource Group existente"
  type        = string
  default     = "rg-fastfood-postech-database"

  validation {
    condition     = length(var.resource_group_name) > 0
    error_message = "O nome do Resource Group não pode estar vazio."
  }
}
variable "postgres_location" {
  description = "Localização para o PostgreSQL"
  type        = string
}
variable "postgres_low_cost_location" {
  description = "Localização do de baixo custo para o PostgreSQL"
  type        = string
}
variable "vnet_name" {
  description = "Nome da Virtual Network existente"
  type        = string
  default     = "vnet-fastfood-postech"

  validation {
    condition     = length(var.vnet_name) > 0
    error_message = "O nome da VNet não pode estar vazio."
  }
}

variable "environment" {
  description = "Ambiente (dev, staging, prod)"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "O ambiente deve ser: dev, staging ou prod."
  }
}

variable "tags" {
  description = "Tags adicionais para aplicar aos recursos"
  type        = map(string)
  default     = {}
}

# =================
# PostgreSQL Variables (Configuração Simples e Econômica)
# =================
variable "postgresql_server_name" {
  description = "Nome do servidor PostgreSQL"
  type        = string
  default     = "psql-fastfood-postech"
}

variable "postgresql_server_name_user_service" {
  description = "Nome do servidor PostgreSQL para o serviço de usuários"
  type        = string
  default     = "psql-fastfood-postech-user-service"
}

variable "postgresql_version" {
  description = "Versão do PostgreSQL"
  type        = string
  default     = "14"
}

variable "postgresql_sku_name" {
  description = "Nome do SKU do PostgreSQL (econômico)"
  type        = string
  default     = "B_Standard_B1ms"
  
  validation {
    condition = contains([
      "B_Standard_B1ms",
      "B_Standard_B2s", 
      "GP_Standard_D2s_v3"
    ], var.postgresql_sku_name)
    error_message = "Use um SKU econômico (Basic B1ms, B2s ou GP D2s_v3)."
  }
}

variable "postgresql_storage_mb" {
  description = "Armazenamento do PostgreSQL em MB"
  type        = number
  default     = 32768  # 32GB
  
  validation {
    condition     = var.postgresql_storage_mb >= 32768 && var.postgresql_storage_mb <= 65536
    error_message = "O armazenamento deve estar entre 32GB e 64GB para economia."
  }
}

variable "postgresql_backup_retention_days" {
  description = "Dias de retenção de backup do PostgreSQL"
  type        = number
  default     = 7
  
  validation {
    condition     = var.postgresql_backup_retention_days >= 7 && var.postgresql_backup_retention_days <= 14
    error_message = "A retenção de backup deve estar entre 7 e 14 dias para economia."
  }
}

variable "postgresql_database_name" {
  description = "Nome do banco de dados principal"
  type        = string
  default     = "fastfood"
}

# =================

# ============================================
# Azure Key Vault Variables
# ============================================

variable "keyvault_name" {
  description = "Nome do Azure Key Vault"
  type        = string
  default     = "kv-fastfood-postech"

  validation {
    condition     = can(regex("^[a-zA-Z]([a-zA-Z0-9-]){1,22}[a-zA-Z0-9]$", var.keyvault_name))
    error_message = "O nome do Key Vault deve ter entre 3-24 caracteres, começar com letra, e conter apenas letras, números e hífens."
  }
}

variable "keyvault_sku_name" {
  description = "SKU do Key Vault (standard ou premium)"
  type        = string
  default     = "standard"

  validation {
    condition     = contains(["standard", "premium"], var.keyvault_sku_name)
    error_message = "SKU deve ser standard ou premium."
  }
}

# Application Security Keys
variable "app_salt_key" {
  description = "Salt key para encriptação de senhas (opcional - será gerado automaticamente se não fornecido)"
  type        = string
  default     = null
  sensitive   = true
}

variable "app_secret_key" {
  description = "Secret key para encriptação de tokens (opcional - será gerado automaticamente se não fornecido)"
  type        = string
  default     = null
  sensitive   = true
}

# ============================================