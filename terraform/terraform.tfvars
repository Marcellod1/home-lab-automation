pve_hostname           = "pve.lab.marcellodb.ca"
pve_cloud_init_user    = "marcello"
pve_cloud_init_ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDeOJZRkcHPmpq3vRia9z17SgtaVrEm8GHkGLdX4+B8FLpvq9RqQaBkAzXsj4b49qpTdwiwlUg4Gtt0+T7B7IHat7HLsu2rGBjHgQ7QKoSVBXVrha8KvOtSFE/sgAupWGVz/CWegH5QKCrx1xgK6nRvUc37hzsJGn/0ghUlE2IoDDj3EJc02XpMKtJGEXsGS+O8rTTUJo7SE0gloYU5Wg+nToxpN73YNKGGs+wh05x2uKY0o+NkJ693smrvuoh5ZG2tYblLy3f4ZUqWtTXRbqzLCnx3txi9rfV5xYPpY/8hCHPyzq4yiuFdSzXzaxnLJD/wn9BjWiGt+3NjZa8w9k6wzn1+KKp5tOZt9tS8bAiRdDsoH2jzUDkqLeRqduuGVtWZAHPltFBVPd9L0zJIZl86I55JX7ABzyo4JWLfqhysJgUKAxgQrjOexsasb2mfr6zNl8jSCQMtpdgy+RVjiwj50c/05TzW7TBO96iX6YUQjfNP9fcB6lxPwW93opa0f1s9GHxt123H7jbexjcNci8f9A2eLVxM0DwGlaMfAs+yK3cCVQA9HZGqjDTSZ5t5XnNaYB5JddDXyO4nuqYmP2m4Fj4KR4uXc2ArJ/2GSyvNj6L9vUECa86eE7kgxDGuH1Bkr4jCz846LSS6Lx2SQR7kPTvH0mN07PYaqJJl/kKShw== marcello,2023-02-16"
pve_vms = {
  docker02 = {
    node       = "pve02"
    template   = "ubu-noble-template"
    cores      = 4
    memory_gb  = 8
    storage_gb = 24
  }

  kube-master01 = {
    node       = "pve05"
    template   = "ubu-noble-template"
    cores      = 4
    memory_gb  = 4
    storage_gb = 24
    state      = "stopped"
  }

  kube-worker01 = {
    node       = "pve05"
    template   = "ubu-noble-template"
    cores      = 4
    memory_gb  = 4
    storage_gb = 24
    state      = "stopped"
  }

  kube-worker02 = {
    node       = "pve05"
    template   = "ubu-noble-template"
    cores      = 4
    memory_gb  = 4
    storage_gb = 24
    state      = "stopped"
  }
}