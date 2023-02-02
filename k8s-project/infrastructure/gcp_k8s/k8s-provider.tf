# Terraform google cloud multi tier Kubernetes deployment
# AGISIT Lab Cloud-Native Application in a Kubernetes Cluster

terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    docker = {
      source = "kreuzwerker/docker"
      version = "2.15.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.13.0"
    }
  }
}
data "google_client_config" "default" {
}

provider "kubernetes" {

  host = "https://${var.host}"

  token                  = data.google_client_config.default.access_token
  client_certificate     = base64decode(var.client_certificate)
  client_key             = base64decode(var.client_key)
  cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}
