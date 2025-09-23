# SoatElevenFastFood - Database Infrastructure

Este repositório contém a infraestrutura como código (IaC) para provisionamento e gerenciamento do banco de dados da aplicação **SoatElevenFastFood**.

## 📋 Sobre o Projeto

Este repositório é responsável exclusivamente pela criação e gerenciamento da infraestrutura de banco de dados para a aplicação SoatElevenFastFood, utilizando **Terraform** para automatizar o provisionamento de recursos de banco de dados gerenciado em nuvem.

## 🛠️ Tecnologias Utilizadas

- **Terraform**: Infrastructure as Code (IaC) para provisionamento automatizado
- **PostgreSQL**: Sistema de gerenciamento de banco de dados

## 🚀 Como usar

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

## 📁 Estrutura do Projeto

```
├── modules/database/  # Módulo do banco de dados
├── variables.tf       # Declaração de variáveis
├── outputs.tf         # Outputs da infraestrutura
├── main.tf           # Configuração principal
└── terraform.tfvars  # Variáveis de configuração
```

## 🗄️ Recursos Provisionados

Este repositório provisiona:
- ✅ Banco de dados gerenciado (RDS/Azure SQL/Cloud SQL)
- ✅ Configurações de segurança e acesso


## 📚 Referências

### Terraform
- [Documentação Oficial do Terraform](https://www.terraform.io/docs)
- [Terraform Registry](https://registry.terraform.io/) - Módulos e providers
- [Terraform Best Practices](https://www.terraform.io/docs/cloud/guides/recommended-practices/index.html)

### Provedores de Nuvem
- [AWS RDS Documentation](https://docs.aws.amazon.com/rds/)
- [Azure SQL Database Documentation](https://docs.microsoft.com/azure/sql-database/)
- [Google Cloud SQL Documentation](https://cloud.google.com/sql/docs)

---

**Projeto**: SoatElevenFastFood - Infraestrutura de Banco de Dados
