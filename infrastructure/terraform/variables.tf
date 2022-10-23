variable "vm" {
  description = "Homelab Machines"
  type        = map(any)
  default = {
    test1 = {
      name      = "test-1"
      ip        = "192.168.90.100/24"
      gateway   = "192.168.90.1"
      disk_size = "30G"
    }
    test2 = {
      name      = "test-2"
      ip        = "192.168.90.110/24"
      gateway   = "192.168.90.1"
      disk_size = "30G"
    }
    #controller = {
    #controller = {
    #  name : "controller-1.ergho.org"
    #  ipconfig : "ip=192.168.30.100/24,gw=192.168.30.1"
    #  disk_size = "30G"

    #}
    #worker1 = {
    #  name : "worker-1.ergho.org"
    #  ipconfig : "ip=192.168.30.110/24,gw=192.168.30.1"
    #  disk_size = "30G"
    #}
    #worker2 = {
    #  name : "worker-2.ergho.org"
    #  ipconfig : "ip=192.168.30.111/24,gw=192.168.30.1"
    #  disk_size = "30G"
    #}
    #worker3 = {
    #  name : "worker-3.ergho.org"
    #  ipconfig : "ip=192.168.30.112/24,gw=192.168.30.1"
    #  disk_size = "30G"
    #}
    #vpn = {
    #  name : "vpn.ergho.org"
    #  ipconfig : "ip=192.168.30.240/24,gw=192.168.30.1"
    #  disk_size = "20G"
    #}
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
