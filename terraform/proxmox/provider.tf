terraform {
  cloud {
    hostname     = "app.terraform.io"
    organization = "ergho"

    workspaces {
      name = "home-proxmox"
    }
  }

  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.14"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_parallel         = 2
  pm_debug            = true
  pm_log_file         = "tf_log_proxmox.log"
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}
