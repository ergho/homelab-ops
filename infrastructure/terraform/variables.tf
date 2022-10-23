variable "vm" {
  description = "Homelab Machines"
  type        = map(any)
  default = {
    controller = {
      name      = "k8controller-1.ergho.org"
      mem       = 4096
      ip        = "192.168.90.100/24"
      gateway   = "192.168.90.1"
      disk_size = "50G"
    }
    k8w1 = {
      name      = "k8worker-1.ergho.org"
      mem       = 8192
      ip        = "192.168.90.110/24"
      gateway   = "192.168.90.1"
      disk_size = "50G"
    }
    k8w2= {
      name      = "k8worker-2.ergho.org"
      mem       = 8192
      ip        = "192.168.90.111/24"
      gateway   = "192.168.90.1"
      disk_size = "50G"
    }
    k8w3= {
      name      = "k8worker-3.ergho.org"
      mem       = 8192
      ip        = "192.168.90.112/24"
      gateway   = "192.168.90.1"
      disk_size = "50G"
    }
  }
}

variable "pm_api_url" {
  type = string
}

variable "pm_api_token_id" {
  type = string
}

variable "pm_api_token_secret" {
  type = string
}

variable "ssh_key" {
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIArlYhGEl8PFy5q1tEvg0+U7SDjAMrIWZv3BCtyv1tIZ ergho@ergho"
}
variable "ssh_key_file" {
  default = "~/.ssh/id_ed25519.pub"
}

variable "proxmox_host" {
  type = string
}

variable "template_name" {
  type = string
}

variable "storage_name" {
  type = string
}
