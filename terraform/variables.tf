variable "pve_hostname" {
  type = string
}

variable "pve_api_token_id" {
  type      = string
  sensitive = true
}

variable "pve_api_token_secret" {
  type      = string
  sensitive = true
}

variable "pve_vms" {
  type = map(object({
    node       = string
    template   = string
    cores      = number
    memory_gb  = number
    storage_gb = number
    storage    = optional(string, "local-lvm")
    state      = optional(string, "running")
  }))
}

variable "pve_cloud_init_user" {
  type = string
}

variable "pve_cloud_init_ssh_key" {
  type = string
}