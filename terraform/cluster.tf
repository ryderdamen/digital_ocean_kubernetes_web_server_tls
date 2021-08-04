resource "digitalocean_kubernetes_cluster" "default_cluster" {
  name   = var.cluster_name
  region = var.region
  version = "1.21.2-do.2"
  node_pool {
    name       = "${var.cluster_name}-default-pool"
    size       = var.default_node_size
    auto_scale = true
    min_nodes  = var.min_nodes
    max_nodes  = var.max_nodes
  }
}
