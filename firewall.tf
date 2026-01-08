
resource "linode_firewall" "application_1125" {
  label           = "application-1125"
  inbound_policy  = "DROP"
  outbound_policy = "ACCEPT"

  inbound {
    label    = "HTTP"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "80"
    ipv4     = local.cloudflare_ipv4
    ipv6     = local.cloudflare_ipv6
  }

  inbound {
    label    = "HTTPS"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "443"
    ipv4     = local.cloudflare_ipv4
    ipv6     = local.cloudflare_ipv6
  }

  inbound {
    label    = "SSH"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = var.ssh_port
    ipv4     = var.allowed_ssh_cidrs
    ipv6     = var.allowed_ssh_cidrs_ipv6
  }

  linodes = [linode_instance.application_1125.id]

  depends_on = [
    linode_instance.application_1125
  ]
}
