
variable digitalocean_token {
  description = "The API token from your Digital Ocean control panel"
  type        = string
}

variable cluster_name {
  description = "The name of the kubernetes cluster to create"
  type        = string
}

variable cluster_version {
  description = "The version of the kubernetes cluster to create"
  type        = string
}

variable region {
  description = "The digital ocean region slug for where to create resources"
  type        = string
  default     = "tor1"
}

variable top_level_domains {
  description = "Top level domains to create records and pods for"
  type    = list(string)
}

variable letsencrypt_email {
  type = string
}

variable min_nodes {
  description = "The minimum number of nodes in the default pool"
  type        = number
  default     = 1
}

variable max_nodes {
  description = "The maximum number of nodes in the default pool"
  type        = number
  default     = 3
}

variable default_node_size {
  description = "The default digital ocean node slug for each node in the default pool"
  type        = string
  default     = "s-1vcpu-2gb"
}
