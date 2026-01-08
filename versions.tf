terraform {
  cloud {
    organization = "Xenwiki"

    workspaces {
      name = "infrastructure"
    }
  }

  required_providers {
    linode = {
      source  = "linode/linode"
      version = "~> 2.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

provider "linode" {
  token = var.linode_token
}

# Dummy token hack - cloudflare_ip_ranges is public but provider requires auth
provider "cloudflare" {
  api_token = "0000000000000000000000000000000000000000"
}
