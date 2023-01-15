# Automatização de criação de Máquinas Virtuais no VMware ESXi com Terraform
Esse projeto visa facilitar a criação de máquinas virtuais, dentre outros recursos, por meio de código no VMWare ESXi utilizando da ferramenta Terraform.

## Sobre
A infraestrutura tradicional é dominante em boa parte das empresas no Brasil, com seus próprios datacenters instalados localmente, é comum que os seus servidores sejam instalados em virtualizadores para melhor aproveitar os recursos das máquinas. Além disso, é visto que analistas utilizam de meios manuais para criar novas máquinas e gerenciar recursos, utilizando dashboards web, o que ocasiona na lentidão para concluir uma atividade simples.

Atualmente é possível acelerar esse processo por meio de ferramentas que provem automatização desse trabalho, nesse caso, utilizaremos o Terraform para criar máquinas virtuais no VMWare ESXi através da API que o virtualizador fornece para essa finalidade. 

## Requisitos
- <b>Terraform v1.3.7</b>

Segue documentação oficial da Hashicorp para instalação: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
- <b>Servidor VMWare ESXi licenciado (Necessário para obter acesso a API do ESXi)</b>

Artigo contendo etapas para baixar e licenciar o vSphere Hypervisor:
https://kb.vmware.com/s/article/2107518
- <b>Usuário root</b>

## Como usar?
1.  Clonar o repositório
```
git clone https://github.com/themrbx/terraform-vmware-esxi.git
```
2. No arquivo terraform.tfvars há as variáveis a serem preenchidas

3. Comandos a serem executados
```
$ terraform init
$ terraform plan
$ terraform apply -var-file terraform.tfvars
```

