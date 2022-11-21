terraform {
  required_version = ">= 1.3.0"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.28.0"
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

output "thing" {
    value = chomp(data.http.ipv4.response_body)
}
