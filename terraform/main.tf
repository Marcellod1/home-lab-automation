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
  memory      = each.value.memory_gb * 1024
  ciuser      = var.pve_cloud_init_user
  sshkeys     = var.pve_cloud_init_ssh_key
  # https://forum.proxmox.com/threads/combining-custom-cloud-init-with-auto-generated.59008/page-3#post-428772EOF
  # Custom vendor cloud init block to handle the install of the qemu guest agent and rebooting after cloud init runs to sync up DHCP leases
  # The vendor.yaml cloud config file must be present locally on all proxmox hosts under var/lib/vz/snippets/vendor.yaml
  cicustom    = "vendor=local:snippets/vendor.yaml" 
  ipconfig0   = "ip=dhcp"
  vm_state    = each.value.state

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