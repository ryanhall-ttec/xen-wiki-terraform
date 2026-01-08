locals {
  cloudflare_ipv4 = data.cloudflare_ip_ranges.cloudflare.ipv4_cidr_blocks
  cloudflare_ipv6 = data.cloudflare_ip_ranges.cloudflare.ipv6_cidr_blocks
}
