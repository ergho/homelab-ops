resource "proxmox_vm_qemu" "vm" {
  for_each    = var.vm
  name        = each.value.name
  target_node = var.proxmox_host
  clone       = var.template_name
  agent       = 1
  os_type     = "cloud-init"
  cores       = each.value.cpu
  sockets     = 1
  cpu         = "host"
  memory      = each.value.mem
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"

  disk {
    size     = each.value.disk_size
    type     = "scsi"
    storage  = var.storage_name
    iothread = 1
    ssd      = 1
    discard  = "on"

  }

  network {
    model  = "virtio"
    bridge = "vmbr1"
    tag    = 90
  }

  ipconfig0 = "ip=${each.value.ip},gw=${each.value.gateway}"
  sshkeys   = <<EOF
    ${var.ssh_key}
  EOF

}
