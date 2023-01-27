variable "vm" {
  description = "Homelab K8s Machines"
  type        = map(any)
  default = {
    controller1 = {
      node      = "pve"
      name      = "k8controller-1.ergho.org"
      mem       = 4096
      cpu       = 4
      ip        = "192.168.90.100/24"
      gateway   = "192.168.90.1"
      disk_size = "50G"
      disk_type = "scsi"
      boot      = true
      order     = "order=110"
      interface = "vmbr1"
      vlan      = 90
    }
    controller2 = {
      node      = "pve2"
      name      = "k8controller-2.ergho.org"
      mem       = 4096
      cpu       = 4
      ip        = "192.168.90.101/24"
      gateway   = "192.168.90.1"
      disk_size = "50G"
      disk_type = "scsi"
      boot      = true
      order     = "order=110"
      interface = "vmbr0"
      vlan      = 90
    }
    k8w1 = {
      node      = "pve"
      name      = "k8worker-1.ergho.org"
      mem       = 12288
      cpu       = 8
      ip        = "192.168.90.110/24"
      gateway   = "192.168.90.1"
      disk_size = "50G"
      disk_type = "scsi"
      boot      = true
      order     = "order=110"
      interface = "vmbr1"
      vlan      = 90

    }
    k8w2 = {
      node      = "pve"
      name      = "k8worker-2.ergho.org"
      mem       = 12288
      cpu       = 8
      ip        = "192.168.90.111/24"
      gateway   = "192.168.90.1"
      disk_size = "50G"
      disk_type = "scsi"
      boot      = true
      order     = "order=110"
      interface = "vmbr1"
      vlan      = 90
    }
    k8w3 = {
      node      = "pve"
      name      = "k8worker-3.ergho.org"
      mem       = 12288
      cpu       = 8
      ip        = "192.168.90.112/24"
      gateway   = "192.168.90.1"
      disk_size = "50G"
      disk_type = "scsi"
      boot      = true
      order     = "order=110"
      interface = "vmbr1"
      vlan      = 90
    }
    k8w4 = {
      node      = "pve2"
      name      = "k8worker-4.ergho.org"
      mem       = 12288
      cpu       = 8
      ip        = "192.168.90.113/24"
      gateway   = "192.168.90.1"
      disk_size = "50G"
      disk_type = "scsi"
      boot      = true
      order     = "order=110"
      interface = "vmbr0"
      vlan      = 90
    }
  }
}

variable "dns" {
  description = "Homelab DNS Machines"
  type        = map(any)
  default = {
    controller1 = {
      node      = "pve2"
      name      = "dns.ergho.org"
      mem       = 4096
      cpu       = 4
      ip        = "192.168.90.5/24"
      gateway   = "192.168.90.1"
      disk_size = "20G"
      disk_type = "scsi"
      boot      = true
      order     = "order=110"
      interface = "vmbr0"
      vlan      = 90
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
