# FastFood Infrastructure - Pós-Graduação em Arquitetura de Software

Este repositório contém os arquivos de Infrastructure as Code (IaC) utilizados para provisionar e gerenciar a infraestrutura do projeto FastFood, desenvolvido como parte da pós-graduação em Arquitetura de Software.

## 📋 Sobre o Projeto

O projeto FastFood é uma aplicação desenvolvida para demonstrar conceitos de arquitetura de software, incluindo:
- Microserviços
- Clean Architecture
- Domain Driven Design (DDD)
- Infraestrutura como Código (IaC)
- DevOps e CI/CD

## 🏗️ O que é Terraform?

O **Terraform** é uma ferramenta de Infrastructure as Code (IaC) desenvolvida pela HashiCorp que permite definir, provisionar e gerenciar infraestrutura de nuvem usando código declarativo.

### Principais características:
- **Declarativo**: Você descreve o estado desejado da infraestrutura
- **Multi-cloud**: Suporta diversos provedores (AWS, Azure, GCP, etc.)
- **Idempotente**: Execuções múltiplas produzem o mesmo resultado
- **Planejamento**: Mostra as mudanças antes de aplicá-las
- **Versionamento**: Infraestrutura versionada junto com o código

### Vantagens do Terraform:
- ✅ Infraestrutura reproduzível
- ✅ Controle de versão da infraestrutura
- ✅ Colaboração em equipe
- ✅ Redução de erros manuais
- ✅ Documentação automática da infraestrutura

## 🚀 Como usar este repositório

### Pré-requisitos
- [Terraform](https://www.terraform.io/downloads.html) instalado
- Credenciais configuradas para o provedor de nuvem escolhido
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
├── modules/           # Módulos reutilizáveis do Terraform
├── environments/      # Configurações por ambiente (dev, staging, prod)
├── variables.tf       # Declaração de variáveis
├── outputs.tf         # Outputs da infraestrutura
├── main.tf           # Configuração principal
└── terraform.tfvars.example  # Exemplo de variáveis
```

## 🌐 Infraestrutura Provisionada

Este repositório provisiona os seguintes recursos:
- [ ] Compute instances (EC2, VM, etc.)
- [ ] Load Balancers
- [ ] Databases (RDS, SQL Database, etc.)
- [ ] Networking (VPC, Subnets, Security Groups)
- [ ] Storage (S3, Blob Storage, etc.)
- [ ] Monitoring e Logging

## 📚 Referências e Documentação

### Terraform
- [Documentação Oficial do Terraform](https://www.terraform.io/docs)
- [Terraform Registry](https://registry.terraform.io/) - Módulos e providers
- [Terraform Best Practices](https://www.terraform.io/docs/cloud/guides/recommended-practices/index.html)
- [Terraform CLI Commands](https://www.terraform.io/docs/cli/commands/index.html)

### Infrastructure as Code
- [Infrastructure as Code: Dynamic Systems for the Cloud Age](https://www.oreilly.com/library/view/infrastructure-as-code/9781491924334/)
- [Terraform: Up & Running](https://www.terraformupandrunning.com/)

### Arquitetura de Software
- [Clean Architecture - Robert C. Martin](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Domain Driven Design - Eric Evans](https://domainlanguage.com/ddd/)
- [Microservices Patterns - Chris Richardson](https://microservices.io/)

### Provedores de Nuvem
- [AWS Documentation](https://docs.aws.amazon.com/)
- [Azure Documentation](https://docs.microsoft.com/azure/)
- [Google Cloud Documentation](https://cloud.google.com/docs)

## 🤝 Contribuição

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`)
3. Commit suas mudanças (`git commit -am 'Adiciona nova feature'`)
4. Push para a branch (`git push origin feature/nova-feature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto é parte de um trabalho acadêmico da pós-graduação em Arquitetura de Software.

## 👥 Equipe

Desenvolvido pelos alunos da pós-graduação em Arquitetura de Software - FIAP.

---

**Nota**: Este repositório faz parte do projeto acadêmico FastFood para demonstração de conceitos de arquitetura de software e infraestrutura como código.
