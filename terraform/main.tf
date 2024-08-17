terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc3"
    }
  }
  required_version = ">=1.9.4"
}

provider "proxmox" {
  pm_api_url          = "https://${var.pve_hostname}/api2/json"
  pm_api_token_id     = var.pve_api_token_id
  pm_api_token_secret = var.pve_api_token_secret
}

resource "proxmox_vm_qemu" "vm" {
  for_each    = var.pve_vms
  target_node = each.value.node
  name        = each.key
  clone       = each.value.template
  full_clone  = true
  onboot      = true
  agent       = 1
  scsihw      = "virtio-scsi-pci"
  sockets     = 1
  cores       = each.value.cores
  memory      = each.value.memory_mb
  ciuser      = var.pve_cloud_init_user
  sshkeys     = var.pve_cloud_init_ssh_key
  cicustom    = "vendor=local:snippets/vendor.yaml"
  ipconfig0   = "ip=dhcp"

  disks {
    ide {
      ide0 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          storage = "local-lvm"
          size    = "${each.value.storage_gb}G"
        }
      }
    }
  }

  network {
    bridge    = "vmbr0"
    firewall  = false
    link_down = false
    model     = "virtio"
  }
}