resource "digitalocean_loadbalancer" "ingress_load_balancer" {
  name   = "${var.cluster_name}-lb"
  region = var.region
  size = "lb-small"
  algorithm = "round_robin"

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 80
    target_protocol = "http"

  }

  lifecycle {
      ignore_changes = [
        forwarding_rule,
    ]
  }

}
