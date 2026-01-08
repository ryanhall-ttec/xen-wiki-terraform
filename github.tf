provider "github" {
  token = var.github_ansible_token
  owner = "xen-wiki"
}

# Generate Ansible inventory from VPS IPs
locals {
  ansible_inventory = templatefile("${path.module}/ansible-inventory.tpl", {
    application_1125_ip   = data.linode_instance_networking.application_1125.ipv4[0].public[0].address
    database_1125_host    = linode_database_mysql_v2.database_1125.host_primary
    database_1125_port    = linode_database_mysql_v2.database_1125.port
    ssh_port              = var.ssh_port
  })
}

# Store inventory as GitHub Actions secret
resource "github_actions_secret" "ansible_inventory" {
  repository      = var.github_ansible_repository
  secret_name     = "ANSIBLE_INVENTORY"
  plaintext_value = local.ansible_inventory
}

# GitHub Actions variables for 1125 instances
resource "github_actions_secret" "application_public_ip" {
  repository      = var.github_ansible_repository
  secret_name     = "APPLICATION_PUBLIC_IP"
  plaintext_value = data.linode_instance_networking.application_1125.ipv4[0].public[0].address
}

resource "github_actions_secret" "database_host" {
  repository      = var.github_ansible_repository
  secret_name     = "DATABASE_HOST"
  plaintext_value = linode_database_mysql_v2.database_1125.host_primary
}

resource "github_actions_secret" "database_port" {
  repository      = var.github_ansible_repository
  secret_name     = "DATABASE_PORT"
  plaintext_value = linode_database_mysql_v2.database_1125.port
}

# Object storage variables
resource "github_actions_secret" "xenwiki_bucket" {
  repository      = var.github_ansible_repository
  secret_name     = "XENWIKI_BUCKET"
  plaintext_value = linode_object_storage_bucket.xenwiki.label
}

resource "github_actions_secret" "xenwiki_bucket_hostname" {
  repository      = var.github_ansible_repository
  secret_name     = "XENWIKI_BUCKET_HOSTNAME"
  plaintext_value = linode_object_storage_bucket.xenwiki.hostname
}

resource "github_actions_secret" "xenwiki_s3_endpoint" {
  repository      = var.github_ansible_repository
  secret_name     = "XENWIKI_S3_ENDPOINT"
  plaintext_value = linode_object_storage_bucket.xenwiki.s3_endpoint
}

resource "github_actions_secret" "xenwiki_bucket_access_key" {
  repository      = var.github_ansible_repository
  secret_name     = "XENWIKI_BUCKET_ACCESS_KEY"
  plaintext_value = linode_object_storage_key.xenwiki.access_key
}

resource "github_actions_secret" "xenwiki_bucket_secret_key" {
  repository      = var.github_ansible_repository
  secret_name     = "XENWIKI_BUCKET_SECRET_KEY"
  plaintext_value = linode_object_storage_key.xenwiki.secret_key
}
