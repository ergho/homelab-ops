resource "proxmox_vm_qemu" "K8S" {
  for_each    = var.vm
  name        = each.value.name
  target_node = each.value.node
  clone       = var.template_name
  agent       = 1
  os_type     = "cloud-init"
  cores       = each.value.cpu
  sockets     = 1
  cpu         = "host"
  memory      = each.value.mem
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"
  onboot      = each.value.boot
  startup     = each.value.order

  disk {
    size     = each.value.disk_size
    type     = each.value.disk_type
    storage  = var.storage_name
    iothread = 0
    ssd      = 1
    discard  = "on"

  }

  network {
    model  = "virtio"
    bridge = each.value.interface
    tag    = each.value.vlan
  }

  ipconfig0  = "ip=${each.value.ip},gw=${each.value.gateway}"
  nameserver = "192.168.90.5"
  sshkeys    = <<EOF
    ${var.ssh_key}
  EOF

}

resource "proxmox_vm_qemu" "DNS" {
  for_each    = var.dns
  name        = each.value.name
  target_node = each.value.node
  clone       = var.template_name
  agent       = 1
  os_type     = "cloud-init"
  cores       = each.value.cpu
  sockets     = 1
  cpu         = "host"
  memory      = each.value.mem
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"
  onboot      = each.value.boot
  startup     = each.value.order

  disk {
    size     = each.value.disk_size
    type     = each.value.disk_type
    storage  = var.storage_name
    iothread = 0
    ssd      = 1
    discard  = "on"

  }

  network {
    model  = "virtio"
    bridge = each.value.interface
    tag    = each.value.vlan
  }

  ipconfig0 = "ip=${each.value.ip},gw=${each.value.gateway}"
  sshkeys   = <<EOF
    ${var.ssh_key}
  EOF

}
