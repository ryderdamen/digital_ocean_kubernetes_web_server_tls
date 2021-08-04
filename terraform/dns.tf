resource "digitalocean_domain" "top_level_domains" {
    for_each = toset(var.top_level_domains)
    name = each.value
}

resource "digitalocean_record" "a_records" {
  for_each = toset(var.top_level_domains)
  domain = each.value
  type   = "A"
  ttl = 60
  name   = "@"
  value  = digitalocean_loadbalancer.ingress_load_balancer.ip
  depends_on = [
    digitalocean_domain.top_level_domains,
    kubernetes_ingress.default_cluster_ingress
  ]
}

resource "digitalocean_record" "cname_redirects" {
  for_each = toset(var.top_level_domains)
  domain = each.value
  type   = "CNAME"
  ttl = 60
  name   = "www"
  value  = "@"
  depends_on = [
    digitalocean_domain.top_level_domains,
  ]
}
