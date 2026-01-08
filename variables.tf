variable "region" {
  description = "Linode region for all resources"
  type        = string
  default     = "us-east"
}

variable "linode_token" {
  description = "Linode API token (stored in Terraform Cloud as sensitive variable)"
  type        = string
  sensitive   = true
}

variable "github_ansible_token" {
  description = "GitHub personal access token with repo and admin:repo_hook permissions"
  type        = string
  sensitive   = true
}

variable "github_ansible_repository" {
  description = "GitHub repository name without owner (e.g., 'ansible')"
  type        = string
  default     = "ansible"
}

variable "terraform_ssh_key" {
  description = "SSH private key for Terraform provisioners (stored in Terraform Cloud as sensitive variable)"
  type        = string
  sensitive   = true
}

variable "ssh_port" {
  description = "SSH port for provisioned instances"
  type        = string
  sensitive   = true
}

variable "ssh_user" {
  description = "SSH user for provisioned instances"
  type        = string
  sensitive   = true
}

variable "application_type" {
  description = "Linode instance type for application server"
  type        = string
}

variable "application_image" {
  description = "OS image for application server"
  type        = string
}

variable "application_label" {
  description = "Label for application instance"
  type        = string
}

variable "database_type" {
  description = "Linode instance type for database"
  type        = string
}

variable "database_engine" {
  description = "Database engine ID"
  type        = string
}

variable "database_cluster_size" {
  description = "Number of nodes in database cluster"
  type        = number
}

variable "database_label" {
  description = "Label for database instance"
  type        = string
}

variable "allowed_ssh_cidrs" {
  description = "CIDR blocks allowed to SSH"
  type        = list(string)
  sensitive   = true
}

variable "allowed_ssh_cidrs_ipv6" {
  description = "IPv6 CIDR blocks allowed to SSH"
  type        = list(string)
  sensitive   = true
}
