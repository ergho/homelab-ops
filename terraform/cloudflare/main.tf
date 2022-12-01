terraform {
  required_version = ">= 1.3.0"

  cloud {
    hostname     = "app.terraform.io"
    organization = "ergho"

    workspaces {
      name = "home-cloudflare"
    }

  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.29.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.2.1"
    }
  }
}

# obtain home ip
data "http" "ipv4" {
  url = "http://ipv4.icanhazip.com"
}

data "cloudflare_zones" "domain_org" {
    filter {
        name = var.cloudflare_domain_org
    }
}
