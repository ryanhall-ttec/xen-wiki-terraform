output "database_root_password" {
  description = "Root password for database"
  value       = linode_database_mysql_v2.database_1125.root_password
  sensitive   = true
}

output "application_ip" {
  description = "Public IP address of application instance"
  value       = data.linode_instance_networking.application_1125.ipv4[0].public[0].address
}

output "ssh_port" {
  description = "SSH port for application instances"
  value       = var.ssh_port
  sensitive   = true
}

output "ssh_user" {
  description = "SSH user for application instances"
  value       = var.ssh_user
  sensitive   = true
}

output "database_hostname" {
  description = "Primary host for database"
  value       = linode_database_mysql_v2.database_1125.host_primary
}

output "database_port" {
  description = "Port for database"
  value       = linode_database_mysql_v2.database_1125.port
}

output "xenwiki_bucket" {
  description = "xenwiki object storage bucket name"
  value       = linode_object_storage_bucket.xenwiki.label
}

output "xenwiki_bucket_hostname" {
  description = "xenwiki object storage bucket hostname"
  value       = linode_object_storage_bucket.xenwiki.hostname
}

output "xenwiki_s3_endpoint" {
  description = "xenwiki object storage bucket endpoint"
  value       = linode_object_storage_bucket.xenwiki.s3_endpoint
}

output "xenwiki_bucket_access_key" {
  description = "Access key ID for xenwiki object storage bucket"
  value       = linode_object_storage_key.xenwiki.access_key
}

output "xenwiki_bucket_secret_key" {
  description = "Secret key for xenwiki object storage bucket"
  value       = linode_object_storage_key.xenwiki.secret_key
  sensitive   = true
}
