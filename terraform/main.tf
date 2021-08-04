terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.1"
    }
  }
}

provider "digitalocean" {
  token = var.digitalocean_token
}

provider "kubernetes" {
  host    = digitalocean_kubernetes_cluster.default_cluster.endpoint
  token   = digitalocean_kubernetes_cluster.default_cluster.kube_config[0].token
  cluster_ca_certificate = base64decode(
    digitalocean_kubernetes_cluster.default_cluster.kube_config[0].cluster_ca_certificate
  )
}

provider "helm" {
  kubernetes {
    host  = digitalocean_kubernetes_cluster.default_cluster.endpoint
    token = digitalocean_kubernetes_cluster.default_cluster.kube_config[0].token
    cluster_ca_certificate = base64decode(
      digitalocean_kubernetes_cluster.default_cluster.kube_config[0].cluster_ca_certificate
    )
  }
}
