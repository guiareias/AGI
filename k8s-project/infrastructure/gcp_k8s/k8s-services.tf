# The Service for the REDIS Pods
/*
resource "kubernetes_service" "redis" {
  metadata {
    name = "redis"

    labels = {
      app  = "redis"
      tier = "backend"
    }
  }

  spec {
    selector = {
      app  = "redis"
      tier = "backend"
    }

    port {
      port        = 6379
    }
  }
}

# The Service for the Bootstorage Pods
resource "kubernetes_service" "bootstorage-svc" {
  metadata {
    name = "bootstorage-svc"

    labels = {
      app  = "bootstorage"
      tier = "backend"
    }
  }

  spec {
    selector = {
      app  = "bootstorage"
      tier = "backend"
    }

    port {
      port        = 5000
      target_port = 5000
    }
  }
}

# The Service for the Happy Pods
resource "kubernetes_service" "happy-svc" {
  metadata {
    name = "happy-svc"

    labels = {
      app  = "happy"
      tier = "backend"
    }
  }

  spec {
    selector = {
      app  = "happy"
      tier = "backend"
    }

    port {
      port        = 4000
      target_port = 4000
    }
  }
}
*/

/*
# The Service for the Expressed Pods
resource "kubernetes_service" "ambassador-svc" {
  metadata {
    name = "ambassador-svc"

    labels = {
      app  = "ambassador-svc"
      tier = "frontend"
    }

    namespace = kubernetes_namespace.ambassador.id

    annotations = {
      "getambassador.io/config" = <<EOF
        ---
        apiVersion: ambassador/v0
        kind: Mapping
        name: vuecalc-svc_mapping
        prefix: /
        service: vuecalc-svc:2000
        ---
        apiVersion: ambassador/v0
        kind: Mapping
        name: express-svc_mapping
        prefix: /express/
        rewrite: /api/express/
        service: express-svc:3000
        EOF
    }
  }

  spec {
    selector = {
      app  = "ambassador-svc"
      tier = "frontend"
    }

    type = "LoadBalancer"

    port {
      port        = 80
      target_port = 80
    }
  }
}
*/

# The Service for the Expressed Pods
resource "kubernetes_service" "express-svc" {
  metadata {
    name = "express-svc"

    labels = {
      app  = "express-svc"
      tier = "backend"
    }
  }

  spec {
    selector = {
      app  = "express-svc"
      tier = "backend"
    }

    type = "NodePort"

    port {
      port        = 3000
      target_port = 3000
    }
  }
}

#################################################################
# The Service for the Frontend
resource "kubernetes_service" "vuecalc-svc" {
  metadata {
    name = "vuecalc-svc"

    labels = {
      app  = "vuecalc-svc"
      tier = "backend"
    }
  }

  spec {
    selector = {
      app  = "vuecalc-svc"
      tier = "backend"
    }

    type = "NodePort"

    port {
      port        = 80
      target_port = 2000
    }
  }
}
