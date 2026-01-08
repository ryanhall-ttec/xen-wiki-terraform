data "linode_sshkey" "terraform" {
  label = "terraform"
}

data "linode_sshkey" "turtle" {
  label = "turtle"
}

data "linode_instance_networking" "application_1125" {
  linode_id = linode_instance.application_1125.id
}

# Cloudflare IP ranges
data "cloudflare_ip_ranges" "cloudflare" {}
