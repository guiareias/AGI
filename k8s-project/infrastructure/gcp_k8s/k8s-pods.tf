# Defines 2 REDIS
/*
resource "kubernetes_deployment" "redis-db" {
  metadata {
    name = "redis"
    labels = {
      app  = "redis"
      tier = "backend"
    }
  }

  spec {
    progress_deadline_seconds = 1200 # In case of taking longer than 9 minutes
    replicas = 2
    selector {
      match_labels = {
        app  = "redis"
      }
    }
    template {
      metadata {
        labels = {
          app  = "redis"
          tier = "backend"
        }
      }
      spec {
        container {
          image = "docker.io/redis:6.0.5"
          name  = "redis"

          port {
            container_port = 6379
          }

          resources {
            requests = {
              cpu    = "100m"
              memory = "100Mi"
            }
          }
        }
      }
    }
  }
}

# Defines 1 bootstart (not replicated)
resource "kubernetes_deployment" "bootstorage" {
  metadata {
    name = "bootstorage"
    labels = {
      app  = "bootstorage"
      tier = "backend"
    }
  }

  spec {
    progress_deadline_seconds = 1200 # In case of taking longer than 9 minutes
    replicas = 1
    selector {
      match_labels = {
        app  = "bootstorage"
      }
    }
    template {
      metadata {
        labels = {
          app  = "bootstorage"
          tier = "backend"
        }
      }
      spec {
        container {
          image = "docker.io/rodriguespn/bootstorage:latest"
          name  = "bootstorage"

          port {
            container_port = 5000
          }

          resources {
            requests = {
              cpu    = "100m"
              memory = "100Mi"
            }
          }
        }
      }
    }
  }
}

# Defines 1 happy (not replicated)
resource "kubernetes_deployment" "happy" {
  metadata {
    name = "happy"
    labels = {
      app  = "happy"
      tier = "backend"
    }
  }

  spec {
    progress_deadline_seconds = 1200 # In case of taking longer than 9 minutes
    replicas = 1
    selector {
      match_labels = {
        app  = "happy"
      }
    }
    template {
      metadata {
        labels = {
          app  = "happy"
          tier = "backend"
        }
      }
      spec {
        container {
          image = "docker.io/rodriguespn/happy:latest"
          name  = "happy"

          port {
            container_port = 4000
          }

          resources {
            requests = {
              cpu    = "200m"
              memory = "500Mi"
            }
          }
        }
      }
    }
  }
}
*/

/*
# Defines 1 ambassador (not replicated)
resource "kubernetes_deployment" "ambassador-svc" {
  metadata {
    name = "ambassador-svc"
    labels = {
      app  = "ambassador-svc"
      tier = "frontend"
    }

    namespace = kubernetes_namespace.ambassador.id
  }

  spec {
    progress_deadline_seconds = 120 # In case of taking longer than 2 minutes
    replicas = 1
    selector {
      match_labels = {
        app  = "ambassador-svc"
        tier = "frontend"
      }
    }
    template {
      metadata {
        labels = {
          app  = "ambassador-svc"
          tier = "frontend"
        }
      }
      spec {
        container {
          image = "docker.io/datawire/ambassador:0.19.2"
          name  = "ambassador"

          port {
            container_port = 80
          }

          env {
            name  = "AMBASSADOR_NAMESPACE"
            value_from {
              field_ref {
                field_path ="metadata.namespace"
              }
            }
          }

          resources {
            requests = {
              cpu    = "200m"
              memory = "100Mi"
            }
          }
        }
        
        service_account_name = kubernetes_service_account.ambassador.metadata[0].name
      }
    }
  }
}
*/

# Defines 1 express (not replicated)
resource "kubernetes_deployment" "express-svc" {
  metadata {
    name = "express-svc"
    labels = {
      app  = "express-svc"
      tier = "backend"
    }
  }

  spec {
    progress_deadline_seconds = 1200 # In case of taking longer than 9 minutes
    replicas = 1
    selector {
      match_labels = {
        app  = "express-svc"
        tier = "backend"
      }
    }
    template {
      metadata {
        labels = {
          app  = "express-svc"
          tier = "backend"
        }
      }
      spec {
        container {
          image = "docker.io/rodriguespn/expressed:latest"
          name  = "expressed"

          port {
            container_port = 3000
          }

          resources {
            requests = {
              cpu    = "200m"
              memory = "500Mi"
            }
          }

          readiness_probe {
            http_get {
              path = "/api/express/healthz"
              port = 3000
            }
          }

          liveness_probe {
            http_get {
              path = "/api/express/healthz"
              port = 3000
            }
          }
        }
      }
    }
  }
}

/*
Kubernetes_deployment docs
https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment
*/
resource "kubernetes_deployment" "vuecalc-svc" {
    metadata {
        name = "vuecalc-svc"

        labels = {
            app  = "vuecalc-svc"
            tier = "backend"
        }
    }

    spec {
        replicas = 3
        selector {
            match_labels = {
                app  = "vuecalc-svc"
                tier = "backend"
            }
        }

        template {
            metadata {
                labels = {
                    app  = "vuecalc-svc"
                    tier = "backend"
                }
            }
            spec {
                container {
                    image = "docker.io/rodriguespn/vuecalc"
                    name  = "vue-express-redis"

                    port {
                        container_port = 2000
                    }

                    resources {
                        requests = {
                        cpu    = "100m"
                        memory = "100Mi"
                        }
                    }

                    readiness_probe {
                      http_get {
                        path = "/"
                        port = 2000
                      }
                    }

                    liveness_probe {
                      http_get {
                        path = "/"
                        port = 2000
                      }
                    }
                }
            }
        }
    }
}
