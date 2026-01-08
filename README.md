# terraform-infrastructure

Terraform config for Xenharmonic Wiki infrastructure.

# Terraform Cloud Workspace

[Xenwiki/infrastructure](https://app.terraform.io/app/Xenwiki/workspaces/infrastructure)

# Variables

Set in Terraform Cloud workspace (tokens expire, manual rotation required):

- `linode_token` - Linode API token
- `github_ansible_token` - GitHub PAT with `repo` and `admin:repo_hook` for [xen-wiki/ansible](https://github.com/xen-wiki/ansible)
- `terraform_ssh_key` - SSH private key for provisioners

Create tokens: https://github.com/settings/tokens/new

# Using Terraform

```bash
terraform login && terraform init
terraform plan
terraform apply
```

# Using the Makefile

Run `make export-ips` first to confiure Makefile.env. 

```bash
make export-ips                                 # Get connection details from Terraform and configure Makefile.env
make ssh-application                            # SSH to the application host
make rsync-application SRC=<file> [DEST=<path>] # Copy files to/from the application host
```