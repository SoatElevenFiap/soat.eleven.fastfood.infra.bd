# SoatElevenFastFood - Database Infrastructure

Este repositório contém a infraestrutura como código (IaC) para provisionamento e gerenciamento do banco de dados da aplicação **SoatElevenFastFood**.

## Sobre o Projeto

Este repositório é responsável exclusivamente pela criação e gerenciamento da infraestrutura de banco de dados para a aplicação SoatElevenFastFood, utilizando **Terraform** para automatizar o provisionamento de recursos de banco de dados gerenciado em nuvem.

Desenvolvemos uma documentação especificando todas as tabelas existentes e as tomadas de decisões na ADR:
https://github.com/SoatElevenFiap/postech-adrs/blob/main/adr-001-estrutura-de-dados.md

## Tecnologias Utilizadas

- **Terraform**: Infrastructure as Code (IaC) para provisionamento automatizado
- **PostgreSQL**: Sistema de gerenciamento de banco de dados

## Como usar

### Pré-requisitos
- [Terraform](https://www.terraform.io/downloads.html) instalado
- Credenciais configuradas para o provedor de nuvem
- Git para controle de versão

### Comandos básicos
```bash
# Inicializar o Terraform
terraform init

# Planejar as mudanças
terraform plan

# Aplicar as mudanças
terraform apply

# Destruir a infraestrutura
terraform destroy
```

## Estrutura do Projeto

```
├── modules/database/  # Módulo do banco de dados
├── variables.tf       # Declaração de variáveis
├── outputs.tf         # Outputs da infraestrutura
├── main.tf           # Configuração principal
└── terraform.tfvars  # Variáveis de configuração
```

## Recursos Provisionados

Este repositório provisiona:
- ✅ Banco de dados gerenciado (PostgreSQL)
- ✅ Configurações de segurança e acesso

---

**Projeto**: SoatElevenFastFood - Infraestrutura de Banco de Dados
